//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Hakan Türkmen on 16.01.2024.
//

import Foundation
import Alamofire

class NetworkManager
{
    static let shared = NetworkManager()
    let baseUrl = "https://api.weatherapi.com/v1/forecast.json?"
    let apiKey = "38e5745dd3f84a9fae1173409241501"
    
    func getWeatherData(for cityName : String,completed : @escaping (Result<Weather,AFError>) -> ())
    {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        AF.request(baseUrl + "q=\(cityName)&days=5&key=\(apiKey)").responseDecodable(of: Weather.self ,decoder: decoder) { response in
            print(self.baseUrl + "q=\(cityName)&days=5&key=\(self.apiKey)")
             completed(response.result)
        }
        
        
    }
}
