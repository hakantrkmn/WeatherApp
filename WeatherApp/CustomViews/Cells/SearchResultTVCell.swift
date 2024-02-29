//
//  SearchResultTVCell.swift
//  WeatherApp
//
//  Created by Hakan Türkmen on 26.01.2024.
//

import UIKit
import SnapKit
class SearchResultTVCell: UITableViewCell {
    static let  identifier = "SearchResultTVCell"
    var cityName = UILabel()
    var countryName = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) 
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(with city : City)
    {
        cityName.text = city.name
        countryName.text = city.countryName
    }
    
    func configure()
    {
        self.addSubViews(cityName,countryName)
        
        cityName.textAlignment = .left
        countryName.textAlignment = .right
        cityName.snp.makeConstraints { make in
            make.leading.equalTo(self)
            make.top.bottom.equalTo(self)
            make.width.equalTo(self.snp.width).dividedBy(2)
        }
        
        countryName.snp.makeConstraints { make in
            make.trailing.equalTo(self)
            make.top.bottom.equalTo(self)
            make.width.equalTo(self.snp.width).dividedBy(2)
        }
    }
    
}
