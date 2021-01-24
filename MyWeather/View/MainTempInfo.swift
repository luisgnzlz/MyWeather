//
//  MainTempInfo.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 1/21/21.
//

import UIKit

class MainTempInfo: ProgramaticView {
    
    var mainTemp = UILabel()
    var cityName = UILabel()
    var countryName = UILabel()

    override func configure() {
        mainTemp.font = UIFont(name: "Menlo-Bold", size: 70)
        mainTemp.textColor = .green
        mainTemp.textAlignment = .center
        mainTemp.backgroundColor = .blue
        
        cityName.font = UIFont(name: "Menlo-Bold", size: 20)
        cityName.textColor = .green
        cityName.textAlignment = .center
        
        countryName.font = UIFont(name: "Menlo-Bold", size: 20)
        countryName.textAlignment = .center
    }
    
    override func constrain() {
        addConstrainedSubviews(mainTemp,cityName,countryName)
        
        NSLayoutConstraint.activate([
            mainTemp.topAnchor.constraint(equalTo: topAnchor),
            mainTemp.widthAnchor.constraint(equalTo: widthAnchor),
            mainTemp.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            mainTemp.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            cityName.topAnchor.constraint(equalTo: mainTemp.bottomAnchor),
            cityName.trailingAnchor.constraint(equalTo: countryName.leadingAnchor),
            cityName.heightAnchor.constraint(equalToConstant: 30),
            
            
            countryName.topAnchor.constraint(equalTo: mainTemp.bottomAnchor),
            countryName.centerXAnchor.constraint(equalTo: centerXAnchor),
            countryName.widthAnchor.constraint(equalToConstant: 50),
            countryName.heightAnchor.constraint(equalToConstant: 30),
            
                                        
    ])
    }

}
