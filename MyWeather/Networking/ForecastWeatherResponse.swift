//
//  ForecastWeatherResponse.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 9/24/21.
//

import Foundation

struct ForecastWeatherResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case dt, main, wind, weather
        case time = "sys"
    }
    var dt: Int?
    var main: ForecastWeather
    var wind: ForecastWind
    var weather: [ForecastWeatherDiscriptions]
    var time: ForecastTimeWeather
}
