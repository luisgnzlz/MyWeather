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
    var humidityBar = UISlider()
    var humidityNumber = UILabel()
    let windLabel = UILabel()
    var windInfo = UILabel()
    let weatherDesLabel = UILabel()
    var weatherDescrip = UILabel()
    let sunriseLabel = UILabel()
    let sunsetLabel = UILabel()
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
    private let imageWater = UIImage(named: "waterIcon")
    
    
    override func configure() {
        
        weatherInfoTextConfig(windInfo, sunrise, sunset, feelsLike)
        lineSepHelp(lineSep1, lineSep2, lineSep3, lineSep4, lineSep5, lineSep6)
        weatherInfoTextConfigLabel(humidityLabel, windLabel, weatherDesLabel, feelLikeLabel, sunriseLabel, sunsetLabel)
        
        
        windLabel.text = "Wind"
        
        windInfo.textAlignment = .center
        
        feelLikeLabel.text = "Feels Like"
        
        feelsLike.textAlignment = .center
        
        weatherDesLabel.text = "Describtion"
        
        weatherDescrip.lineBreakMode = .byWordWrapping
        weatherDescrip.numberOfLines = 2
        weatherDescrip.textColor = .white
        weatherDescrip.font = UIFont(name: fontNameLabel, size: 18)
        
        humidityLabel.text = "Humidity: "
        
        humidityBar.minimumValue = 0
        humidityBar.maximumValue = 1
        humidityBar.minimumTrackTintColor = UIColor(red: 0.241, green: 0.601, blue: 0.719, alpha: 1.0)
        humidityBar.maximumTrackTintColor = .white
        humidityBar.thumbTintColor = .black
        humidityBar.setThumbImage(imageWater, for: .normal)
        humidityBar.isUserInteractionEnabled = false
        
        humidityNumber.font = UIFont(name: fontNameLabel, size: 20)
        humidityNumber.textColor = .white
        
        sunriseLabel.text = "Sunrise"
        
        sunrise.textAlignment = .center
        
        sunsetLabel.text = "Sunset"
        
        sunset.textAlignment = .center
    }
    
    override func constrain() {
        addConstrainedSubviews(feelLikeLabel, feelsLike, lineSep1, windLabel, windInfo, sunriseLabel, sunsetLabel, lineSep2, lineSep3, lineSep4, lineSep5, lineSep6, weatherDescrip, sunrise, sunset, humidityLabel, humidityBar, humidityNumber)
        
        NSLayoutConstraint.activate([
            
            lineSep1.topAnchor.constraint(equalTo: topAnchor),
            lineSep1.widthAnchor.constraint(equalTo: widthAnchor),
            lineSep1.heightAnchor.constraint(equalToConstant: 1),
            lineSep1.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            weatherDescrip.topAnchor.constraint(equalTo: lineSep1.bottomAnchor, constant: 5),
            weatherDescrip.heightAnchor.constraint(equalToConstant: 60),
            weatherDescrip.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherDescrip.widthAnchor.constraint(equalTo: widthAnchor, constant: -60),
            
            lineSep2.topAnchor.constraint(equalTo: weatherDescrip.bottomAnchor, constant: 10),
            lineSep2.widthAnchor.constraint(equalTo: widthAnchor, constant: -30),
            lineSep2.heightAnchor.constraint(equalToConstant: 1),
            lineSep2.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            humidityLabel.topAnchor.constraint(equalTo: lineSep2.bottomAnchor, constant: 5),
            humidityLabel.trailingAnchor.constraint(equalTo: centerXAnchor),
            humidityLabel.heightAnchor.constraint(equalToConstant: 30),
            
            humidityNumber.topAnchor.constraint(equalTo: lineSep2.bottomAnchor, constant: 5),
            humidityNumber.leadingAnchor.constraint(equalTo: humidityLabel.trailingAnchor),
            humidityNumber.heightAnchor.constraint(equalToConstant: 25),
            
            humidityBar.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor, constant: 5),
            humidityBar.widthAnchor.constraint(equalTo: widthAnchor, constant: -60),
            humidityBar.centerXAnchor.constraint(equalTo: centerXAnchor),
            humidityBar.heightAnchor.constraint(equalToConstant: 30),
            
            lineSep3.topAnchor.constraint(equalTo: humidityBar.bottomAnchor, constant: 10),
            lineSep3.widthAnchor.constraint(equalTo: widthAnchor, constant: -30),
            lineSep3.heightAnchor.constraint(equalToConstant: 1),
            lineSep3.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            windLabel.topAnchor.constraint(equalTo: lineSep3.bottomAnchor, constant: 5),
            windLabel.heightAnchor.constraint(equalToConstant: 30),
            windLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            windLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            windInfo.topAnchor.constraint(equalTo: windLabel.bottomAnchor, constant: 5),
            windInfo.heightAnchor.constraint(equalToConstant: 30),
            windInfo.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            windInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            feelLikeLabel.topAnchor.constraint(equalTo: lineSep3.bottomAnchor, constant: 5),
            feelLikeLabel.heightAnchor.constraint(equalToConstant: 30),
            feelLikeLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            feelLikeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            feelsLike.topAnchor.constraint(equalTo: feelLikeLabel.bottomAnchor, constant: 5),
            feelsLike.heightAnchor.constraint(equalToConstant: 30),
            feelsLike.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            feelsLike.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            lineSep6.topAnchor.constraint(equalTo: windInfo.bottomAnchor, constant: 10),
            lineSep6.widthAnchor.constraint(equalTo: widthAnchor, constant: -30),
            lineSep6.heightAnchor.constraint(equalToConstant: 1),
            lineSep6.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sunriseLabel.topAnchor.constraint(equalTo: lineSep6.bottomAnchor, constant: 5),
            sunriseLabel.heightAnchor.constraint(equalToConstant: 30),
            sunriseLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            sunriseLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            sunrise.topAnchor.constraint(equalTo: sunriseLabel.bottomAnchor, constant: 5),
            sunrise.heightAnchor.constraint(equalToConstant: 30),
            sunrise.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            sunrise.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            sunsetLabel.topAnchor.constraint(equalTo: lineSep6.bottomAnchor, constant: 5),
            sunsetLabel.heightAnchor.constraint(equalToConstant: 30),
            sunsetLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            sunsetLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            sunset.topAnchor.constraint(equalTo: sunsetLabel.bottomAnchor, constant: 5),
            sunset.heightAnchor.constraint(equalToConstant: 30),
            sunset.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            sunset.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
        ])
    }
}
