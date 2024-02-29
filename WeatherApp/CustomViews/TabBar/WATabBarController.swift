//
//  WATabBarController.swift
//  WeatherApp
//
//  Created by Hakan Türkmen on 16.01.2024.
//

import UIKit

class WATabBarController: UITabBarController {

    override func viewDidLoad() 
    {
        super.viewDidLoad()
        UITabBar.appearance().backgroundColor = .systemBackground
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createWeatherInfoVC() , createSearchNC()]
    }
    
    
    func createSearchNC() -> UINavigationController
    {
        let searchVC = SearchVC()
        searchVC.title = "Favorites"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createWeatherInfoVC() -> UINavigationController
    {
        let weatherInfo = WeatherInfoVC()
        weatherInfo.title = "Weather"
        weatherInfo.tabBarItem = UITabBarItem(title: "Weather", image: UIImage(systemName: "thermometer.medium"), tag: 1)
        return UINavigationController(rootViewController: weatherInfo)
    }


}
