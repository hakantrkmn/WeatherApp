//
//  WASummaryView.swift
//  WeatherApp
//
//  Created by Hakan Türkmen on 16.01.2024.
//

import UIKit
import SnapKit

class WASummaryView: UIView {
    let cityName = WASummaryLabel()
    let degree = WASummaryLabel()
    let condition = WASummaryLabel()
    let minDegree = WASummaryLabel()
    let maxDegree = WASummaryLabel()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(with weather : Weather)
    {
        print(weather.location.name)
        cityName.text = weather.location.name
        degree.text = String(Int(weather.current.tempC)) + " Degree"
        condition.text = weather.current.condition.text
        minDegree.text = "Min : " + String(weather.forecast.forecastday[0].day.mintempC )
        maxDegree.text = "Max : " +
        String(weather.forecast.forecastday[0].day.maxtempC)

    }
    
    func configure()
    {
        backgroundColor = .systemBlue
        addSubViews(cityName,degree,condition,minDegree,maxDegree)
        
        
        
        cityName.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.centerX.equalTo(self)
            make.trailing.leading.equalTo(self)
            make.height.equalTo(self.snp.height).dividedBy(4)
        }
        degree.snp.makeConstraints { make in
            make.top.equalTo(cityName.snp.bottom)
            make.centerX.equalTo(self)
            make.trailing.leading.equalTo(self)
            make.height.equalTo(self.snp.height).dividedBy(4)
        }
        condition.snp.makeConstraints { make in
            make.top.equalTo(degree.snp.bottom)
            make.centerX.equalTo(self)
            make.trailing.leading.equalTo(self)
            make.height.equalTo(self.snp.height).dividedBy(4)
        }
        minDegree.snp.makeConstraints { make in
            make.top.equalTo(condition.snp.bottom)
            make.trailing.equalTo(condition.snp.centerX).offset(-5)
            make.height.equalTo(self.snp.height).dividedBy(4)
            make.width.equalTo(condition.snp.width).dividedBy(4)
        }
        maxDegree.snp.makeConstraints { make in
            make.top.equalTo(condition.snp.bottom)
            make.leading.equalTo(condition.snp.centerX).offset(5)
            make.height.equalTo(self.snp.height).dividedBy(4)
            make.width.equalTo(condition.snp.width).dividedBy(4)
        }

    }
    
    
}
