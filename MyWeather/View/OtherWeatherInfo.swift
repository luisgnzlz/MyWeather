//
//  Animations.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 1/21/21.
//

import Foundation
import UIKit


class otherWInfo: ProgramaticView {
    
    var humidityLabel = UILabel()
    var humidityBar = UIProgressView()
    var humidityNumber = UILabel()
    var lowTemp = UILabel()
    let lowTempLabel = UILabel()
    var highTemp = UILabel()
    let highTempLabel = UILabel()
    let windLabel = UILabel()
    var windInfo = UILabel()
    let weatherDesLabel = UILabel()
    var weatherDescrip = UILabel()
    var sunrise = UILabel()
    var sunset = UILabel()
    var feelLikeLabel = UILabel()
    var feelsLike = UILabel()
    private let lineSep1 = UIView()
    private let lineSep2 = UIView()
    private let lineSep3 = UIView()
    private let lineSep4 = UIView()
    private let lineSep5 = UIView()
    private let lineSep6 = UIView()
    
    
    override func configure() {
        
        weatherInfoTextConfig(lowTemp, highTemp, windInfo, weatherDescrip, humidityLabel, sunrise, sunset, feelsLike)
        lineSepHelp(lineSep1, lineSep2, lineSep3, lineSep4, lineSep5, lineSep6)
        weatherInfoTextConfigLabel(lowTempLabel, highTempLabel, windLabel, weatherDesLabel, feelLikeLabel)
        
        lowTempLabel.text = "Low"
        
        lowTemp.textAlignment = .center
        
        highTempLabel.text = "High"
        
        highTemp.textAlignment = .center
        
        windLabel.text = "Wind"
        
        windInfo.textAlignment = .center
        
        feelLikeLabel.text = "Feels Like"
        
        feelsLike.textAlignment = .center
        
        weatherDesLabel.text = "Describtion"
        
        humidityLabel.text = "Humidity: "
        
        humidityBar.progressViewStyle = .bar
        humidityBar.progressTintColor = .darkGray
        humidityBar.trackTintColor = .lightGray
        humidityBar.layer.cornerRadius = 5
        humidityBar.clipsToBounds = true
        
        humidityNumber.font = UIFont(name: "Rockwell-BoldItalic", size: 12)
        humidityNumber.textColor = .white
    }
    
    override func constrain() {
        addConstrainedSubviews(feelLikeLabel, feelsLike, lowTempLabel, highTempLabel, lowTemp, lineSep1, highTemp, windLabel, windInfo, lineSep2, lineSep3, lineSep4, lineSep5, lineSep6, weatherDescrip, sunrise, sunset, weatherDesLabel, humidityLabel, humidityBar, humidityNumber)
        
        NSLayoutConstraint.activate([
            
            lineSep1.topAnchor.constraint(equalTo: topAnchor),
            lineSep1.widthAnchor.constraint(equalTo: widthAnchor),
            lineSep1.heightAnchor.constraint(equalToConstant: 1),
            lineSep1.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            lowTempLabel.topAnchor.constraint(equalTo: lineSep1.bottomAnchor, constant: 20),
            lowTempLabel.heightAnchor.constraint(equalToConstant: 30),
            lowTempLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            lowTempLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            lowTemp.topAnchor.constraint(equalTo: lowTempLabel.bottomAnchor, constant: 5),
            lowTemp.heightAnchor.constraint(equalToConstant: 30),
            lowTemp.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            lowTemp.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            highTempLabel.topAnchor.constraint(equalTo: lineSep1.bottomAnchor, constant: 20),
            highTempLabel.heightAnchor.constraint(equalToConstant: 30),
            highTempLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            highTempLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            highTemp.topAnchor.constraint(equalTo: highTempLabel.bottomAnchor, constant: 5),
            highTemp.heightAnchor.constraint(equalToConstant: 30),
            highTemp.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            highTemp.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            lineSep2.topAnchor.constraint(equalTo: highTemp.bottomAnchor, constant: 20),
            lineSep2.widthAnchor.constraint(equalTo: widthAnchor, constant: -30),
            lineSep2.heightAnchor.constraint(equalToConstant: 1),
            lineSep2.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            humidityLabel.topAnchor.constraint(equalTo: lineSep2.bottomAnchor, constant: 20),
            humidityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            humidityLabel.widthAnchor.constraint(equalToConstant: 150),
            humidityLabel.heightAnchor.constraint(equalToConstant: 30),
            
            humidityBar.topAnchor.constraint(equalTo: lineSep2.bottomAnchor, constant: 20),
            humidityBar.widthAnchor.constraint(equalToConstant: 200),
            humidityBar.leadingAnchor.constraint(equalTo: humidityLabel.trailingAnchor),
            humidityBar.heightAnchor.constraint(equalToConstant: 20),
            
            humidityNumber.topAnchor.constraint(equalTo: humidityBar.topAnchor, constant: 3),
            humidityNumber.centerXAnchor.constraint(equalTo: humidityBar.centerXAnchor),
            humidityNumber.widthAnchor.constraint(equalToConstant: 50),
            humidityNumber.heightAnchor.constraint(equalToConstant: 15),
            
            lineSep3.topAnchor.constraint(equalTo: humidityBar.bottomAnchor, constant: 20),
            lineSep3.widthAnchor.constraint(equalTo: widthAnchor, constant: -30),
            lineSep3.heightAnchor.constraint(equalToConstant: 1),
            lineSep3.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            windLabel.topAnchor.constraint(equalTo: lineSep3.bottomAnchor, constant: 20),
            windLabel.heightAnchor.constraint(equalToConstant: 30),
            windLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            windLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            windInfo.topAnchor.constraint(equalTo: windLabel.bottomAnchor, constant: 5),
            windInfo.heightAnchor.constraint(equalToConstant: 30),
            windInfo.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            windInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            feelLikeLabel.topAnchor.constraint(equalTo: lineSep3.bottomAnchor, constant: 20),
            feelLikeLabel.heightAnchor.constraint(equalToConstant: 30),
            feelLikeLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            feelLikeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            feelsLike.topAnchor.constraint(equalTo: feelLikeLabel.bottomAnchor, constant: 5),
            feelsLike.heightAnchor.constraint(equalToConstant: 30),
            feelsLike.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            feelsLike.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            lineSep4.topAnchor.constraint(equalTo: windInfo.bottomAnchor, constant: 20),
            lineSep4.widthAnchor.constraint(equalTo: widthAnchor, constant: -30),
            lineSep4.heightAnchor.constraint(equalToConstant: 1),
            lineSep4.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            weatherDesLabel.topAnchor.constraint(equalTo: lineSep4.bottomAnchor, constant: 20),
            weatherDesLabel.heightAnchor.constraint(equalToConstant: 30),
            weatherDesLabel.widthAnchor.constraint(equalTo: widthAnchor),
            weatherDesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            weatherDescrip.topAnchor.constraint(equalTo: weatherDesLabel.bottomAnchor, constant: 5),
            weatherDescrip.heightAnchor.constraint(equalToConstant: 30),
            weatherDescrip.widthAnchor.constraint(equalTo: widthAnchor),
            weatherDescrip.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            lineSep6.topAnchor.constraint(equalTo: weatherDescrip.bottomAnchor, constant: 20),
            lineSep6.widthAnchor.constraint(equalTo: widthAnchor, constant: -30),
            lineSep6.heightAnchor.constraint(equalToConstant: 1),
            lineSep6.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sunrise.topAnchor.constraint(equalTo: lineSep6.bottomAnchor, constant: 20),
            sunrise.heightAnchor.constraint(equalToConstant: 30),
            sunrise.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2),
            sunrise.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            sunset.topAnchor.constraint(equalTo: lineSep6.bottomAnchor, constant: 20),
            sunset.heightAnchor.constraint(equalToConstant: 30),
            sunset.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2),
            sunset.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
