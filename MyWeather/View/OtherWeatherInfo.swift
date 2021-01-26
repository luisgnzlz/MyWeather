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
    var highTemp = UILabel()
    var windSpeed = UILabel()
    var windDegree = UILabel()
    var weatherDescrip = UILabel()
    var sunrise = UILabel()
    var sunset = UILabel()
    private let lineSep1 = UIView()
    private let lineSep2 = UIView()
    private let lineSep3 = UIView()
    private let lineSep4 = UIView()
    private let lineSep5 = UIView()
    private let lineSep6 = UIView()
    
    
    override func configure() {
        
        weatherInfoTextConfig(lowTemp, highTemp, windSpeed, windDegree, weatherDescrip, humidityLabel, sunrise, sunset)
        lineSepHelp(lineSep1, lineSep2, lineSep3, lineSep4, lineSep5, lineSep6
        )
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
        addConstrainedSubviews(lowTemp, lineSep1, highTemp, windSpeed, lineSep2, lineSep3, lineSep4, lineSep5, lineSep6, windDegree, weatherDescrip, sunrise, sunset, humidityLabel, humidityBar, humidityNumber)
        
        NSLayoutConstraint.activate([
            
            lineSep1.topAnchor.constraint(equalTo: topAnchor),
            lineSep1.widthAnchor.constraint(equalTo: widthAnchor),
            lineSep1.heightAnchor.constraint(equalToConstant: 1),
            lineSep1.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            lowTemp.topAnchor.constraint(equalTo: lineSep1.bottomAnchor, constant: 20),
            lowTemp.heightAnchor.constraint(equalToConstant: 30),
            lowTemp.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            lowTemp.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            highTemp.topAnchor.constraint(equalTo: lineSep1.bottomAnchor, constant: 20),
            highTemp.heightAnchor.constraint(equalToConstant: 30),
            highTemp.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            highTemp.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
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
            
            windSpeed.topAnchor.constraint(equalTo: lineSep3.bottomAnchor, constant: 20),
            windSpeed.heightAnchor.constraint(equalToConstant: 30),
            windSpeed.widthAnchor.constraint(equalTo: widthAnchor),
            windSpeed.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            lineSep4.topAnchor.constraint(equalTo: windSpeed.bottomAnchor, constant: 20),
            lineSep4.widthAnchor.constraint(equalTo: widthAnchor, constant: -30),
            lineSep4.heightAnchor.constraint(equalToConstant: 1),
            lineSep4.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            windDegree.topAnchor.constraint(equalTo: lineSep4.bottomAnchor, constant: 20),
            windDegree.heightAnchor.constraint(equalToConstant: 30),
            windDegree.widthAnchor.constraint(equalTo: widthAnchor),
            windDegree.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            lineSep5.topAnchor.constraint(equalTo: windDegree.bottomAnchor, constant: 20),
            lineSep5.widthAnchor.constraint(equalTo: widthAnchor, constant: -30),
            lineSep5.heightAnchor.constraint(equalToConstant: 1),
            lineSep5.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            weatherDescrip.topAnchor.constraint(equalTo: lineSep5.bottomAnchor, constant: 20),
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
