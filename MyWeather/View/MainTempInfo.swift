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
        mainTemp.font = UIFont(name: "Menlo-Bold", size: 50)
        mainTemp.textColor = .green
        mainTemp.textAlignment = .center
        
        cityName.font = UIFont(name: "Menlo-Bold", size: 20)
        cityName.textColor = .green
        
        countryName.font = UIFont(name: "Menlo-Bold", size: 20)
    }
    
    override func constrain() {
        addConstrainedSubviews(mainTemp,cityName,countryName)
        
        NSLayoutConstraint.activate([
            mainTemp.topAnchor.constraint(equalTo: topAnchor),
            mainTemp.widthAnchor.constraint(equalTo: widthAnchor),
            mainTemp.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainTemp.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
           // cityName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 15),
           // cityName.leadingAnchor.constraint(equalTo: leadingAnchor),
           // cityName.trailingAnchor.constraint(equalTo: countryName.leadingAnchor),
           // cityName.heightAnchor.constraint(equalToConstant: 30),
                                        
    ])
    }

}
