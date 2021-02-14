//
//  ForecastCollectionViewCell.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 2/14/21.
//

import UIKit

class ForecastCollectionViewCell: UICollectionViewCell {
    
    let mainWeatherLabel = UILabel()
    let weatherImage = UIImageView()
    let highWeatherLabel = UILabel()
    let lowWeatherLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0.441, green: 0.801, blue: 0.919, alpha: 1.0)
        configure()
        constrain()
    }
    
    func configure() {
        weatherInfoTextConfig(mainWeatherLabel)
        mainWeatherLabel.textAlignment = .center
        
        weatherInfoTextConfigLabel(highWeatherLabel, lowWeatherLabel)
    }
    
    func constrain() {
        addConstrainedSubviews(mainWeatherLabel, highWeatherLabel, lowWeatherLabel)
        
        NSLayoutConstraint.activate([
            mainWeatherLabel.topAnchor.constraint(equalTo: topAnchor),
            mainWeatherLabel.widthAnchor.constraint(equalTo: widthAnchor),
            mainWeatherLabel.heightAnchor.constraint(equalToConstant: 40),
            
            highWeatherLabel.topAnchor.constraint(equalTo: mainWeatherLabel.bottomAnchor, constant: 5),
            highWeatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            highWeatherLabel.trailingAnchor.constraint(equalTo: centerXAnchor),
            highWeatherLabel.heightAnchor.constraint(equalToConstant: 20),
            
            lowWeatherLabel.topAnchor.constraint(equalTo: mainWeatherLabel.bottomAnchor, constant: 5),
            lowWeatherLabel.leadingAnchor.constraint(equalTo: highWeatherLabel.trailingAnchor),
            lowWeatherLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            lowWeatherLabel.heightAnchor.constraint(equalToConstant: 20),
        
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
