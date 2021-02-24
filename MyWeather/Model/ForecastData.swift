//
//  ForecastData.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 2/15/21.
//

import Foundation
import UIKit

struct ForecastData {
    var main = Int()
    var highTemp = Int()
    var lowTemp = Int()
    var imageWeather = UIImage()
    
    init(mainWeather: UIImage) {
        self.imageWeather = mainWeather
    }
    
    init() {
    }
}
