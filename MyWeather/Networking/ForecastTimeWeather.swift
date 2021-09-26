//
//  ForecastTimeWeather.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 9/24/21.
//

import Foundation

struct ForecastTimeWeather: Codable {
    enum CodingKeys: String, CodingKey {
        case pod
    }

    var pod: String

}
