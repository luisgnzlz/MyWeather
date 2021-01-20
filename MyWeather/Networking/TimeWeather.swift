//
//  TimeWeather.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 1/19/21.
//

import Foundation

struct TimeWeather: Codable {
    enum CodingKeys: String, CodingKey {
        case type, message, country, sunrise, sunset
    }
    
    var type: Int
    var message: Double?
    var country: String
    var sunrise: Int
    var sunset: Int
}
