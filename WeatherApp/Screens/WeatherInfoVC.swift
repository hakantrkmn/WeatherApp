//
//  ViewController.swift
//  WeatherApp
//
//  Created by Hakan Türkmen on 16.01.2024.
//

import UIKit

class WeatherInfoVC: UIViewController {
    var weatherData : Weather?
    
    var summaryView = WASummaryView()
    var hoursView = WAHoursView()
    var daysView = WADaysView()
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
                
                let hour = Calendar.current.component(.hour, from: Date())
                self.hoursView.hours = success.forecast.forecastday[0].hour
                self.hoursView.hours.removeFirst(hour)
                self.daysView.daysWeather = success.forecast.forecastday
                DispatchQueue.main.async{
                    self.hoursView.collectionView.reloadData()
                    self.daysView.tableView.reloadData()

                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func configureView()
    {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubViews(summaryView,hoursView,daysView)
        
        summaryView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.trailing.leading.equalTo(view).inset(100)
            make.height.equalTo(200)
        }
        
        hoursView.snp.makeConstraints { make in
            make.top.equalTo(summaryView.snp.bottom)
            make.trailing.leading.equalTo(summaryView)
            make.height.equalTo(120)
        }
        
        daysView.snp.makeConstraints { make in
            make.top.equalTo(hoursView.snp.bottom)
            make.trailing.leading.equalTo(summaryView)
            make.height.equalTo(400)
        }
    }
    
    
}

