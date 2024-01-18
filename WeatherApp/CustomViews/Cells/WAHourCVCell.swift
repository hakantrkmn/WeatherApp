//
//  WAHourCVCell.swift
//  WeatherApp
//
//  Created by Hakan Türkmen on 18.01.2024.
//

import UIKit
import SDWebImage
class WAHourCVCell: UICollectionViewCell
{
    static let identifier = "WAHourCVCell"
    
    let hourLabel = UILabel()
    let weatherIcon = UIImageView()
    let degreeLabel = UILabel()
    
    override init(frame: CGRect) 
    {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) 
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(with hourWeather : Hour)
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        let hourString = formatter.string(from: hourWeather.time) // "12 AM"
        
        hourLabel.text = hourString
        weatherIcon.sd_setImage(with: URL(string: "https:" + hourWeather.condition.icon))
        
        degreeLabel.text = String(hourWeather.tempC)
    }
    
    
    func configure()
    {
        addSubViews(hourLabel,weatherIcon,degreeLabel)
        hourLabel.textAlignment = .center
        degreeLabel.textAlignment = .center
        hourLabel.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.centerX.equalTo(self)
            make.height.equalTo(self.snp.height).dividedBy(3)
            make.width.equalTo(hourLabel.snp.height)
        }
        
        weatherIcon.snp.makeConstraints { make in
            make.top.equalTo(hourLabel.snp.bottom)
            make.centerX.equalTo(self)
            make.height.equalTo(self.snp.height).dividedBy(3)
            make.width.equalTo(weatherIcon.snp.height)
        }
        
        degreeLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherIcon.snp.bottom)
            make.centerX.equalTo(self)
            make.height.equalTo(self.snp.height).dividedBy(3)
            make.width.equalTo(degreeLabel.snp.height)
        }
    }
}
