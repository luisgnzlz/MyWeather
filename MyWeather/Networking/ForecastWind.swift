//
//  ForecastWind.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 9/24/21.
//

import Foundation

struct ForecastWind: Codable {
    enum CodingKeys: String, CodingKey {
        case speed, gust
        case degree = "deg"
    }
    
    var speed: Double
    var degree: Int
    var gust: Double
}
