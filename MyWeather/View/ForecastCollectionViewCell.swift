//
//  ForecastCollectionViewCell.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 2/14/21.
//

import UIKit

class ForecastCollectionViewCell: UICollectionViewCell {
    
    let dateInfo = UILabel()
    let timeInfo = UILabel()
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
        forecastHeader(mainWeatherLabel, dateInfo)
        
        weatherImage.contentMode = .scaleAspectFill
        
        forecastFooter(timeInfo)
    }
    
    func constrain() {
        addConstrainedSubviews(dateInfo, weatherImage, mainWeatherLabel)
        
        NSLayoutConstraint.activate([
            dateInfo.topAnchor.constraint(equalTo: topAnchor),
            dateInfo.widthAnchor.constraint(equalTo: widthAnchor),

            weatherImage.widthAnchor.constraint(equalTo: widthAnchor),
            weatherImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherImage.heightAnchor.constraint(equalToConstant: 40),
            
            mainWeatherLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor),
            mainWeatherLabel.widthAnchor.constraint(equalTo: widthAnchor),
            mainWeatherLabel.heightAnchor.constraint(equalToConstant: 20),
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
