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
    let minDegree = WASummaryLabel()
    let maxDegree = WASummaryLabel()
    
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
        iconImage.sd_setImage(with: URL(string: "https:" + dayWeather.day.condition.icon))
        minDegree.text = "Min : " + String(dayWeather.day.mintempC)
        maxDegree.text = "Max : " + String(dayWeather.day.maxtempC)

    }
    
    func configure()
    {
        dayLabel.textAlignment = .left
        minDegree.textAlignment = .center
        maxDegree.textAlignment = .center
        
        addSubViews(dayLabel,iconImage,minDegree,maxDegree)
        
        dayLabel.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.leading.equalTo(self)
            make.width.equalTo(self).dividedBy(4)
            make.height.equalTo(self)
        }
        
        iconImage.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.leading.equalTo(dayLabel.snp.trailing)
            make.width.equalTo(self).dividedBy(4)
            make.height.equalTo(iconImage.snp.width)
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
