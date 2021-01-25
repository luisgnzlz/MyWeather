//
//  MainTempInfo.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 1/21/21.
//

import UIKit

class MainTempInfo: ProgramaticView {
    
    var mainTemp = UILabel()
    var cityAndState = UILabel()

    override func configure() {
        mainTemp.font = UIFont(name: "Menlo-Bold", size: 70)
        mainTemp.textColor = .black
        mainTemp.textAlignment = .center
        
        cityAndState.font = UIFont(name: "Menlo-Bold", size: 20)
        cityAndState.textColor = .black
        cityAndState.textAlignment = .center
        
    }
    
    override func constrain() {
        addConstrainedSubviews(mainTemp,cityAndState)
        
        NSLayoutConstraint.activate([
            mainTemp.topAnchor.constraint(equalTo: topAnchor),
            mainTemp.widthAnchor.constraint(equalTo: widthAnchor),
            mainTemp.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            mainTemp.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            cityAndState.topAnchor.constraint(equalTo: mainTemp.bottomAnchor),
            cityAndState.centerXAnchor.constraint(equalTo: centerXAnchor),
            cityAndState.heightAnchor.constraint(equalToConstant: 25),
            
    ])
    }

}
