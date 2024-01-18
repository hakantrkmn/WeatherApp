//
//  String+Ext.swift
//  WeatherApp
//
//  Created by Hakan Türkmen on 18.01.2024.
//

import Foundation


extension String
{
    func converToDate() -> Date?
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        return dateFormatter.date(from: self)
    }
    func getDateDayName() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayInWeek = dateFormatter.string(from: self.converToDate()!)
        return dayInWeek
    }
    
}
