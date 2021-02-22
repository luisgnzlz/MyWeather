//
//  ForecastData.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 2/15/21.
//

import Foundation

struct ForecastData {
    var main = Int()
    
    init(main: Int) {
        self.main = main
    }
    
    init() {
    }
}
