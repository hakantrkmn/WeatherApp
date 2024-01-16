//
//  SearchVC.swift
//  WeatherApp
//
//  Created by Hakan Türkmen on 16.01.2024.
//

import UIKit

class SearchVC: UIViewController {

    var weatherData : Weather?
    
    var summaryView = WASummaryView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureView()
        getWeatherData()
    }
    
    
    
    func getWeatherData()
    {
        NetworkManager.shared.getWeatherData(for: "trabzon") { result in
            switch result 
            {
            case .success(let success):
                self.weatherData = success
                self.summaryView.set(with: self.weatherData!)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func configureView()
    {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(summaryView)
        
        summaryView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.trailing.leading.equalTo(view).inset(100)
            make.height.equalTo(200)
        }
    }



}
