//
//  SearchVC.swift
//  WeatherApp
//
//  Created by Hakan Türkmen on 16.01.2024.
//

import UIKit
import SnapKit


class SearchVC: UIViewController  {
    
    var favorites = [City]()
    let searchController = UISearchController(searchResultsController: SearchResultVC())
    var tableView = UITableView()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.placeholder = "Search for City"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesSearchBarWhenScrolling = false
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) 
    {
        getFavorites()
    }
    
    func getFavorites()
    {
        PersistenceManager.retrieveFavorites { result in
            switch result {
            case .success(let success):
                if success.isEmpty
                {
                    print("liste boş")
                }
                else
                {
                    self.favorites = success
                    DispatchQueue.main.async{
                        self.tableView.reloadData()
                    }
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func configure()
    {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchResultTVCell.self, forCellReuseIdentifier: SearchResultTVCell.identifier)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.trailing.leading.equalTo(view).inset(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

extension SearchVC : UISearchResultsUpdating,UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favorites.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        let firstNav = tabBarController?.viewControllers?[0] as! UINavigationController
                
        let secondTab = firstNav.viewControllers[0] as! WeatherInfoVC
        secondTab.cityName = favorites[indexPath.row].name
        secondTab.city = favorites[indexPath.row]
        secondTab.getWeatherData()
        tabBarController?.selectedIndex = 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTVCell.identifier, for: indexPath) as? SearchResultTVCell else
        {
            return UITableViewCell()
            
        }
        var cities = [City]()
        PersistenceManager.retrieveFavorites { result in
            switch result {
            case .success(let success):
                cities = success
            case .failure(let failure):
                print(failure)
            }
        }
        cell.set(with: cities[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            
            PersistenceManager.updateWith(favorite: favorites[indexPath.row], actionType: .Remove) { result in
                tableView.beginUpdates()
                self.favorites.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
                tableView.endUpdates()
            }
            
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) 
    {
        guard let text = searchController.searchBar.text else 
        {
            return
        }
        tableView.transform = CGAffineTransformMakeTranslation(0, 200)
        let vc = searchController.searchResultsController as? SearchResultVC
        vc?.delegate = self
        NetworkManager.shared.getCityNames(for: text) { result in
            switch result {
            case .success(let success):
                let filtered = success.filter{$0.type == "state"}
                vc?.cities.removeAll()
                vc?.cities = filtered
                DispatchQueue.main.async{
                    vc?.tableView.reloadData()
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    
}

extension SearchVC : SearchResultDelegate
{
    func citySelected(city: City) {
        
        let firstNav = tabBarController?.viewControllers?[0] as! UINavigationController
                
        let secondTab = firstNav.viewControllers[0] as! WeatherInfoVC
        secondTab.cityName = city.name
        secondTab.city = city
        secondTab.getWeatherData()
        tabBarController?.selectedIndex = 0
        

    }
}
