//
//  ForecastWeatherDiscriptions.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 9/24/21.
//

import Foundation

struct ForecastWeatherDiscriptions: Codable {
    enum CodingKeys: String, CodingKey {
        case id, description, icon
        case shortDescription = "main"
    }
    
    var id: Int
    var shortDescription: String
    var description: String
    var icon: String
}
