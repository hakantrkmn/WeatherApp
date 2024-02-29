//
//  ErrorMessages.swift
//  WeatherApp
//
//  Created by Hakan Türkmen on 5.02.2024.
//

import Foundation

enum WAError : String , Error
{
    case alreadyInFavorites = "City is already in favorites"
    case unableToComplete = "Unable to complete request"
    case invalidResponse = "Invalid response from the server"
    case unableToFavorite = "There is error favoriting city"

}
