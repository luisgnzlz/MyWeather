//
//  Wind.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 1/19/21.
//

import Foundation

struct Wind: Codable {
    enum CodingKeys: String, CodingKey {
        case speed
        case degree = "deg"
    }
    
    var speed: Double
    var degree: Int
}
