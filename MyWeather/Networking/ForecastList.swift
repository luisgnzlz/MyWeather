//
//  ForecastList.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 9/24/21.
//

import Foundation

struct ForecastList: Codable {
    enum CodingKeys: String, CodingKey {
        case list
    }
    var list: [ForecastWeatherResponse]
}
