//
//  WADaysView.swift
//  WeatherApp
//
//  Created by Hakan Türkmen on 18.01.2024.
//

import UIKit
import SnapKit

class WADaysView: UIView
{
    var tableView = UITableView()
    var daysWeather = [Forecastday]()
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        configureTableView()
        configure()
    }
    
    required init?(coder: NSCoder) 
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTableView()
    {
        tableView.register(WADayTVCell.self, forCellReuseIdentifier: WADayTVCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configure()
    {
        
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}
extension WADaysView : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WADayTVCell.identifier, for: indexPath) as? WADayTVCell else
        {
            return UITableViewCell()
        }
        cell.set(with: daysWeather[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Int(self.frame.height)/daysWeather.count)
    }
    
    
}
