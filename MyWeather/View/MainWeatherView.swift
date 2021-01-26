//
//  MainWeatherView.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 1/20/21.
//

import Foundation
import UIKit

class MainWeatherView: ProgramaticView {
    
    var otherWeatherInfo = otherWInfo()
    var mainTemp = MainTempInfo()
    
    override func constrain() {
        backgroundColor = UIColor(red: 0.441, green: 0.801, blue: 0.919, alpha: 1.0)
        addConstrainedSubviews(mainTemp,otherWeatherInfo)
        
        NSLayoutConstraint.activate([
                                        
            mainTemp.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainTemp.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3),
            mainTemp.widthAnchor.constraint(equalTo: widthAnchor),
            
            otherWeatherInfo.topAnchor.constraint(equalTo: mainTemp.bottomAnchor),
            otherWeatherInfo.widthAnchor.constraint(equalTo: widthAnchor),
            otherWeatherInfo.bottomAnchor.constraint(equalTo: bottomAnchor),
                                        
            ])
    }
}
