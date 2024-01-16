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
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        AF.request(baseUrl + "q=\(cityName)&days=5&key=\(apiKey)").responseDecodable(of: Weather.self ,decoder: decoder) { response in
            completed(response.result)
        }
        
        
    }
}
