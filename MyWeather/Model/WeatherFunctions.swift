//
//  WeatherFunctions.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 2/12/21.
//

import Foundation
import UIKit

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

func forecastTimeSet(convertTime: Double) -> String {
    let sunsetDate = Date(timeIntervalSince1970: Double(convertTime))
    let sunsetDateFormatter = DateFormatter()
    sunsetDateFormatter.timeZone = TimeZone(abbreviation: "UTC/GMT")
    sunsetDateFormatter.locale = NSLocale.current
    sunsetDateFormatter.timeStyle = .short
    let sunsetData = sunsetDateFormatter.string(from: sunsetDate)
    let shortString = sunsetData.replacingOccurrences(of: "00", with: "")
    let shorterString = shortString.replacingOccurrences(of: ":", with: "").replacingOccurrences(of: " ", with: "")
        return shorterString
    }

func forecastDateSet(convertTime: Double) -> String {
    let sunsetDate = Date(timeIntervalSince1970: Double(convertTime))
    let sunsetDateFormatter = DateFormatter()
    sunsetDateFormatter.timeZone = TimeZone(abbreviation: "UTC/GMT")
    sunsetDateFormatter.locale = NSLocale.current
    sunsetDateFormatter.timeStyle = .none
    sunsetDateFormatter.dateStyle = .full
    let sunsetData = sunsetDateFormatter.string(from: sunsetDate)
    let dateString = sunsetData.prefix(3)
        return "\(dateString)"
    }

func forecastWeatherInfo(_ mainWeather: [Int]) -> [Int]{
    let currentWeather = mainWeather[0]
    let high = mainWeather[1]
    let low = mainWeather[2]
    
    return [currentWeather, high, low]
}
