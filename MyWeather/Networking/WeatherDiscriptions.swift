//
//  WeatherDiscription.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 1/19/21.
//

import Foundation

struct WeatherDiscriptions: Codable {
    enum CodingKeys: String, CodingKey {
        case id, description, icon
        case shortDescription = "main"
    }
    
    var id: Int
    var shortDescription: String
    var description: String
    var icon: String
}
