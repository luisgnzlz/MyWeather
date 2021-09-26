//
//  ForecastWeather.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 9/24/21.
//

import Foundation

struct ForecastWeather: Codable {
    enum CodingKeys: String, CodingKey {
        case temp, feels_like
        case lowTemp = "temp_min"
        case highTemp = "temp_max"
        case pressure, humidity
    }
    
    var temp: Double
    var feels_like: Double
    var lowTemp: Double
    var highTemp: Double
    var pressure: Int
    var humidity: Int
    
}
