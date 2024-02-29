//
//  ViewController.swift
//  WeatherApp
//
//  Created by Hakan Türkmen on 16.01.2024.
//

import UIKit



class WeatherInfoVC: UIViewController {
    
    
    
    var cityName : String?
    var city : City?
    var weatherData : Weather?
    
    var scrollView = UIScrollView()
    var contentView = UIView()
    
    var summaryView = WASummaryView()
    var hoursView = WAHoursView()
    var daysView = WADaysView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureView()
        getWeatherData()
        let addButton = UIBarButtonItem(barButtonSystemItem: .add , target : self , action : #selector(addButtonTapped) )
        navigationItem.rightBarButtonItem = addButton
    }
    @objc func addButtonTapped()
    {
        PersistenceManager.updateWith(favorite: city!, actionType: .Add) { result in
            if result == nil
            {
                self.presentAlert(title: "Eklendi", message: "Şehir başarıyla eklendi", buttonTitle: "Tamam")
                print("başarılı")
            }
            else
            {
                self.presentAlert(title: "Error", message: result?.rawValue ?? "", buttonTitle: "Tamam")
                
            }
        }
    }

    
  
    
    func getWeatherData()
    {
        NetworkManager.shared.getWeatherData(for: cityName ?? "istanbul") { result in
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
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubViews(summaryView,hoursView,daysView)
        
        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView.snp.width)
            make.bottom.equalTo(daysView)
        }
        
        
        summaryView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.trailing.leading.equalTo(contentView).inset(100)
            make.height.equalTo(200)
        }
        
        hoursView.snp.makeConstraints { make in
            make.top.equalTo(summaryView.snp.bottom)
            make.trailing.leading.equalTo(contentView).inset(50)
            make.height.equalTo(120)
        }
        
        daysView.snp.makeConstraints { make in
            make.top.equalTo(hoursView.snp.bottom)
            make.trailing.leading.equalTo(contentView).inset(50)
            make.height.equalTo(400)
        }
        
      
    }
    
    
}

