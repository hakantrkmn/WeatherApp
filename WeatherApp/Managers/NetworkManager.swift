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
    
    let cityBaseUrl = "https://city-and-state-search-api.p.rapidapi.com/search?q="
    let cityApiKey = "115b81585emsh54eb55d7a53b803p1b252bjsnfd356d61253d"
    
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
             completed(response.result)
        }
        
        
    }
    
    func getCityNames(for searchKey : String,completed : @escaping (Result<[City],AFError>) -> ())
    {
        let urlString   = cityBaseUrl + "\(searchKey)&limit=8"
        let headers : HTTPHeaders = [
            "X-RapidAPI-Key": cityApiKey,
            "X-RapidAPI-Host": "city-and-state-search-api.p.rapidapi.com"
        ]
        
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        AF.request(urlString,method: .get,headers: headers).responseDecodable(of: [City].self ,decoder: decoder) { response in
            completed(response.result)
        }
        
        
    }
}
