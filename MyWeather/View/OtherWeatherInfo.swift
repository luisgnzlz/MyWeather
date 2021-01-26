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
    
    
    override func configure() {
        
        weatherInfoTextConfig(lowTemp, highTemp, windSpeed, windDegree, weatherDescrip, humidityLabel, sunrise, sunset)
        
        lowTemp.text = "Low: "

        highTemp.text = "High: "

        windSpeed.text = "Wind Speed: "

        windDegree.text = "Wind Degree: "

        weatherDescrip.text = "Description: "
        
        sunrise.text = "Sunrise: "
        
        sunset.text = "Sunset: "

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
        addConstrainedSubviews(humidityLabel,humidityBar,humidityNumber)
        
        NSLayoutConstraint.activate([
            
            humidityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            humidityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            humidityLabel.widthAnchor.constraint(equalToConstant: 100),
            humidityLabel.heightAnchor.constraint(equalTo: humidityBar.heightAnchor, constant: 5),
            
            humidityBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            humidityBar.widthAnchor.constraint(equalToConstant: 200),
            humidityBar.leadingAnchor.constraint(equalTo: humidityLabel.trailingAnchor, constant: 5),
            humidityBar.heightAnchor.constraint(equalToConstant: 15),
            
            humidityNumber.topAnchor.constraint(equalTo: humidityBar.topAnchor, constant: 3),
            humidityNumber.centerXAnchor.constraint(equalTo: humidityBar.centerXAnchor),
            humidityNumber.widthAnchor.constraint(equalToConstant: 50),
            humidityNumber.heightAnchor.constraint(equalToConstant: 15),
        ])
    }
}
