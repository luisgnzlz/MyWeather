//
//  WeatherFunctions.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 2/12/21.
//

import Foundation
import UIKit

var bgColor = UIColor(red: 0.441, green: 0.801, blue: 0.919, alpha: 1.0)

func windLocation(_ direction: Int) -> String {
    var nesw = ""
    
    switch direction {
    case 315..<360:
        nesw = "NW "
    case 270..<314:
        nesw = "W "
    case 225..<269:
        nesw = "SW "
    case 180..<224:
        nesw = "S "
    case 135..<179:
        nesw = "SE "
    case 90..<134:
        nesw = "E "
    case 45..<89:
        nesw = "NE "
    case 0..<44:
        nesw = "N "
    default:
        nesw = ""
    }
    
    return nesw
}

func sunsetSunriseTimeSet(convertTime: Double) -> String {
        let sunsetDate = Date(timeIntervalSince1970: Double(convertTime))
        let sunsetDateFormatter = DateFormatter()
        sunsetDateFormatter.timeZone = TimeZone(abbreviation: "UTC/GMT")
        sunsetDateFormatter.locale = NSLocale.current
        sunsetDateFormatter.dateFormat = "hh:mm"
        let sunsetData = sunsetDateFormatter.string(from: sunsetDate)
        return sunsetData
    }

func forecastWeatherInfo(_ mainWeather: [Int]) -> [Int]{
    let currentWeather = mainWeather[0]
    let high = mainWeather[1]
    let low = mainWeather[2]
    
    return [currentWeather, high, low]
}
