//
//  SearchResultVC.swift
//  WeatherApp
//
//  Created by Hakan Türkmen on 26.01.2024.
//

import UIKit

protocol SearchResultDelegate
{
    func citySelected(city :City)
}

class SearchResultVC: UIViewController {
    
    var delegate : SearchResultDelegate?
    var tableView = UITableView()
    var cities = [City]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SearchResultTVCell.self, forCellReuseIdentifier: SearchResultTVCell.identifier)
        configureUI()
       
    }
    
    func configureUI()
    {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.width.equalTo(view)
            make.height.equalTo(100)
            make.centerX.equalTo(view)
        }
        tableView.separatorStyle = .none
    }

}
extension SearchResultVC :  UITableViewDelegate,UITableViewDataSource
{
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
    {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTVCell.identifier, for: indexPath) as? SearchResultTVCell else
        {
            return UITableViewCell()
        }
        
        cell.set(with: self.cities[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? SearchResultTVCell
        
        dismiss(animated: true)

        delegate?.citySelected(city: self.cities[indexPath.row])


        

    }
}
