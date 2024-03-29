//
//  MainTempInfo.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 1/21/21.
//

import UIKit

class MainTempInfo: ProgramaticView {
    
    var mainTemp = UILabel()
    var infoLabel = UILabel()
    var infoPic = UIImageView()
    var cityAndState = UILabel()
    var lowTemp = UILabel()
    let lowTempLabel = UILabel()
    var highTemp = UILabel()
    let highTempLabel = UILabel()
    let weatherImg = UIImageView()
    let settingsButton = UIButton()
    let searchButton = UIButton()

    override func configure() {
        mainTemp.font = UIFont(name: "Charter-Roman", size: 70)
        mainTemp.textColor = .white
        mainTemp.textAlignment = .center
        
        settingsButton.setBackgroundImage(UIImage(systemName: "line.horizontal.3"), for: .normal)
        settingsButton.tintColor = .white
        settingsButton.contentMode = .scaleAspectFill
        
        searchButton.setBackgroundImage(UIImage(systemName: "plus.magnifyingglass"), for: .normal)
        searchButton.tintColor = .white
        searchButton.contentMode = .scaleAspectFill
        
        cityAndState.font = UIFont(name: "Charter-Roman", size: 24)
        cityAndState.textColor = .white
        cityAndState.textAlignment = .center
        
        weatherImg.contentMode = .scaleAspectFill
        
        infoLabel.font = UIFont(name: "Charter-Roman", size: 12)
        infoLabel.textColor = .white
        infoLabel.textAlignment = .center
        
        lowTempLabel.text = "↓ "
        lowTempLabel.textColor = .white
        
        lowTemp.textAlignment = .center
        lowTemp.font = UIFont(name: "Charter-Roman", size: 16)
        lowTemp.textColor = .white
        
        highTempLabel.text = "↑ "
        highTempLabel.textColor = .white
        
        highTemp.textAlignment = .center
        highTemp.font = UIFont(name: "Charter-Roman", size: 16)
        highTemp.textColor = .white
        
    }
    
    override func constrain() {
        addConstrainedSubviews(mainTemp, cityAndState, weatherImg, settingsButton, searchButton, infoLabel, lowTempLabel, lowTemp, highTempLabel, highTemp)
        
        NSLayoutConstraint.activate([
            
            cityAndState.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cityAndState.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            
            infoLabel.topAnchor.constraint(equalTo: cityAndState.bottomAnchor, constant: 5),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            
            mainTemp.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: -10),
            mainTemp.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            
            weatherImg.topAnchor.constraint(equalTo: topAnchor),
            weatherImg.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            
            settingsButton.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            settingsButton.leadingAnchor.constraint(equalTo: weatherImg.trailingAnchor),
            settingsButton.widthAnchor.constraint(equalToConstant: 25),
            settingsButton.heightAnchor.constraint(equalToConstant: 25),
            
            searchButton.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: 10),
            searchButton.leadingAnchor.constraint(equalTo: weatherImg.trailingAnchor),
            searchButton.widthAnchor.constraint(equalToConstant: 25),
            searchButton.heightAnchor.constraint(equalToConstant: 25),
            
            highTempLabel.topAnchor.constraint(equalTo: mainTemp.bottomAnchor),
            highTempLabel.heightAnchor.constraint(equalToConstant: 30),
            highTempLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            
            highTemp.topAnchor.constraint(equalTo: mainTemp.bottomAnchor),
            highTemp.heightAnchor.constraint(equalToConstant: 30),
            highTemp.leadingAnchor.constraint(equalTo: highTempLabel.trailingAnchor),
            
            lowTempLabel.topAnchor.constraint(equalTo: mainTemp.bottomAnchor),
            lowTempLabel.heightAnchor.constraint(equalToConstant: 30),
            lowTempLabel.leadingAnchor.constraint(equalTo: highTemp.trailingAnchor, constant: 15),
            
            lowTemp.topAnchor.constraint(equalTo: mainTemp.bottomAnchor),
            lowTemp.heightAnchor.constraint(equalToConstant: 30),
            lowTemp.leadingAnchor.constraint(equalTo: lowTempLabel.trailingAnchor),
            
    ])
    }

}
