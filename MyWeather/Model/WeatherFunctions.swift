//
//  WeatherFunctions.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 2/12/21.
//

import Foundation

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
