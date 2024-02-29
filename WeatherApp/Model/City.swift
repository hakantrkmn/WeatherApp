//
//  City.swift
//  WeatherApp
//
//  Created by Hakan Türkmen on 24.01.2024.
//

import Foundation

// MARK: - WelcomeElement
struct City: Codable {
    let id: Int?
    var name, stateCode: String?
    let type: String?
    let countryName: String?
    let countryID: Int?
    let countryCode: String?
    let stateName: String?
    let stateID: Int?

  
}

enum TypeEnum: String, Codable {
    case city = "city"
    case state = "state"
}


