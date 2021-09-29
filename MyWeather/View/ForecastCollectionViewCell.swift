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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        constrain()
    }
    
    func configure() {
        forecastHeader(dateInfo)
        
        timeInfo.font = UIFont(name: fontNameLabel, size: 18)
        timeInfo.textColor = fontColor
        timeInfo.textAlignment = .center
        
        weatherImage.contentMode = .scaleAspectFill
        
        forecastFooter(mainWeatherLabel)
    }
    
    func constrain() {
        addConstrainedSubviews(dateInfo, timeInfo, weatherImage, mainWeatherLabel)
        
        NSLayoutConstraint.activate([
            dateInfo.topAnchor.constraint(equalTo: topAnchor),
            dateInfo.widthAnchor.constraint(equalTo: widthAnchor),
            
            timeInfo.topAnchor.constraint(equalTo: dateInfo.bottomAnchor),
            timeInfo.widthAnchor.constraint(equalTo: widthAnchor),

            weatherImage.widthAnchor.constraint(equalTo: widthAnchor),
            weatherImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherImage.topAnchor.constraint(equalTo: timeInfo.bottomAnchor, constant: 5),
            weatherImage.heightAnchor.constraint(equalToConstant: 40),
            
            mainWeatherLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 5),
            mainWeatherLabel.widthAnchor.constraint(equalTo: widthAnchor),
            mainWeatherLabel.heightAnchor.constraint(equalToConstant: 20),
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
