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
    
    override func configure() {
        
        humidityLabel.font = UIFont(name: "Rockwell-BoldItalic", size: 15)
        humidityLabel.textColor = .white
        humidityLabel.text = "Humidity: "
        
        humidityBar.progressViewStyle = .bar
        humidityBar.progressTintColor = .black
        humidityBar.trackTintColor = .white
        humidityBar.layer.cornerRadius = 5
        humidityBar.clipsToBounds = true
        
        humidityNumber.font = UIFont(name: "Rockwell-BoldItalic", size: 12)
        humidityNumber.textColor = .lightGray
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
