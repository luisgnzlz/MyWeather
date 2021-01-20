//
//  Weather.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 1/19/21.
//

import Foundation

struct WeatherResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case main, wind, weather
        case time = "sys"
    }
    var main: Weather
    var wind: Wind
    var weather: [WeatherDiscription]
    var time: TimeWeather
}
