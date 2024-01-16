//
//  SearchVC.swift
//  WeatherApp
//
//  Created by Hakan Türkmen on 16.01.2024.
//

import UIKit

class SearchVC: UIViewController {

    var weatherData : Weather?
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        getWeatherData()
    }
    
    
    func getWeatherData()
    {
        NetworkManager.shared.getWeatherData(for: "ankara") { result in
            switch result 
            {
            case .success(let success):
                self.weatherData = success
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    



}
