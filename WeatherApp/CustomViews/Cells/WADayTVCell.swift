//
//  WADayTVCell.swift
//  WeatherApp
//
//  Created by Hakan Türkmen on 18.01.2024.
//

import UIKit

class WADayTVCell: UITableViewCell 
{
    static let identifier = "WADayTVCell"
    
    let dayLabel = UILabel()
    let iconImage = UIImageView()
    let minDegree = UILabel()
    let maxDegree = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) 
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(with dayWeather : Forecastday)
    {
    
        dayLabel.text = dayWeather.date.getDateDayName()
        minDegree.text = String(dayWeather.day.mintempC)
        maxDegree.text = String(dayWeather.day.maxtempC)

    }
    
    func configure()
    {
        addSubViews(dayLabel,iconImage,minDegree,maxDegree)
        
        dayLabel.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.leading.equalTo(self)
            make.width.equalTo(self).dividedBy(4)
            make.height.equalTo(self)
        }
        
        iconImage.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.leading.equalTo(dayLabel.snp.trailing)
            make.width.equalTo(self).dividedBy(4)
            make.height.equalTo(self)
        }
        
        minDegree.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.leading.equalTo(iconImage.snp.trailing)
            make.width.equalTo(self).dividedBy(4)
            make.height.equalTo(self)
        }
        
        maxDegree.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.leading.equalTo(minDegree.snp.trailing)
            make.width.equalTo(self).dividedBy(4)
            make.height.equalTo(self)
        }
    }
}
