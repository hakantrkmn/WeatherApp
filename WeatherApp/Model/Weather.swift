// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Weather: Codable {
    let location: Location
    let current: Current
    let forecast: Forecast
}

// MARK: - Current
struct Current: Codable {
    let lastUpdatedEpoch: Double
    let lastUpdated: String
    let tempC, tempF, isDay: Double
    let condition: Condition
    let windMph: Double
    let windKph, windDegree: Double
    //let windDir: WindDir
    let pressureMb: Double
    let pressureIn: Double
    let precipMm, precipIn, humidity, cloud: Double
    let feelslikeC, feelslikeF, visKm, visMiles: Double
    let uv: Double
    let gustMph, gustKph: Double

}

// MARK: - Condition
struct Condition: Codable {
    let text, icon: String
    let code: Int
}

enum WindDir: String, Codable {
    case s = "S"
    case ssw = "SSW"
    case sw = "SW"
    case wnw = "WNW"
}

// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [Forecastday]
}

// MARK: - Forecastday
struct Forecastday: Codable {
    let date: String
    let dateEpoch: Int
    let day: Day
    let astro: Astro
    let hour: [Hour]

}

// MARK: - Astro
struct Astro: Codable {
    let sunrise, sunset, moonrise, moonset: String
    let moonPhase: String
    let moonIllumination, isMoonUp, isSunUp: Int


}

// MARK: - Day
struct Day: Codable {
    let maxtempC, maxtempF, mintempC, mintempF: Double
    let avgtempC, avgtempF, maxwindMph, maxwindKph: Double
    let totalprecipMm, totalprecipIn: Double
    let totalsnowCm: Double
    let avgvisKm: Double
    let avgvisMiles, avghumidity, dailyWillItRain, dailyChanceOfRain: Int
    let dailyWillItSnow, dailyChanceOfSnow: Int
    let condition: Condition
    let uv: Int


}

// MARK: - Hour
struct Hour: Codable {
    let timeEpoch: Int
    let time: Date
    let tempC, tempF: Double
    let isDay: Int
    let condition: Condition
    let windMph, windKph: Double
    let windDegree: Int
    //let windDir: WindDir
    let pressureMb: Int
    let pressureIn, precipMm, precipIn: Double
    let snowCm, humidity, cloud: Int
    let feelslikeC, feelslikeF, windchillC, windchillF: Double
    let heatindexC, heatindexF, dewpointC, dewpointF: Double
    let willItRain, chanceOfRain, willItSnow, chanceOfSnow: Int
    let visKm, visMiles: Double
    let gustMph, gustKph: Double
    let uv: Double
    let shortRad, diffRad: Double?

}

// MARK: - Location
struct Location: Codable {
    let name, region, country: String
    let lat, lon: Double
    let tzId: String
    let localtimeEpoch: Int
    let localtime: String

}
