//
//  SearchOptionView.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 9/9/21.
//

import UIKit

class SearchOptionView: ProgramaticView {

    let viewScroller = UIView()
    let search = UITextField()
    let searchButton = UIButton()
    let weatherLabel = UILabel()
    let weatherImage = UIImageView()
    let cityName = UILabel()
    let stateName = UILabel()
    let lineSep = UIView()
    let weatherDiscripLabel = UILabel()
    let lowTempLabel = UILabel()
    let lowTemp = UILabel()
    let highTempLabel = UILabel()
    let highTemp = UILabel()
    
    
    override func configure() {
        
        viewScroller.backgroundColor = .lightGray
        viewScroller.layer.cornerRadius = 5
        
        cityName.font = UIFont.boldSystemFont(ofSize: 30)
        cityName.text = "City,"
        cityName.textColor = .white
        cityName.shadowColor = .black
        
        stateName.font = UIFont.boldSystemFont(ofSize: 30)
        stateName.text = "State"
        stateName.textColor = .white
        stateName.shadowColor = .black
        
        lineSep.backgroundColor = .white
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        
        search.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.6)
        search.layer.borderWidth = 1
        search.layer.borderColor = UIColor.black.cgColor
        search.placeholder = "Quick Search"
        search.layer.cornerRadius = 5
        search.layer.masksToBounds = true
        search.font = UIFont.systemFont(ofSize: 24)
        search.returnKeyType = .search
        search.leftView = paddingView
        search.leftViewMode = .always
        
        searchButton.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.contentMode = .scaleAspectFill
        searchButton.tintColor = .black
        
        weatherLabel.font = UIFont(name: "Charter-Roman", size: 70)
        weatherLabel.textColor = .white
        weatherLabel.shadowColor = .black
        weatherLabel.textAlignment = .center
        weatherLabel.text = "--°"
        
        weatherImage.contentMode = .scaleAspectFill
        
        weatherDiscripLabel.font = UIFont(name: "Charter-Roman", size: 12)
        weatherDiscripLabel.textColor = .white
        weatherDiscripLabel.textAlignment = .center
        
        lowTempLabel.text = "↓ "
        lowTempLabel.textColor = .white
        
        lowTemp.textAlignment = .center
        lowTemp.font = UIFont(name: "Charter-Roman", size: 16)
        lowTemp.textColor = .white
        lowTemp.text = "--"
        
        highTempLabel.text = "↑ "
        highTempLabel.textColor = .white
        
        highTemp.textAlignment = .center
        highTemp.font = UIFont(name: "Charter-Roman", size: 16)
        highTemp.textColor = .white
        highTemp.text = "--"
    }
    
    override func constrain() {
        addConstrainedSubviews(viewScroller, cityName, stateName, lineSep, search, searchButton, weatherLabel, weatherImage, highTempLabel, highTemp, lowTempLabel, lowTemp)
        
        NSLayoutConstraint.activate([
        
            viewScroller.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            viewScroller.centerXAnchor.constraint(equalTo: centerXAnchor),
            viewScroller.widthAnchor.constraint(equalToConstant: 50),
            viewScroller.heightAnchor.constraint(equalToConstant: 5),
            
            search.topAnchor.constraint(equalTo: viewScroller.bottomAnchor, constant: 15),
            search.widthAnchor.constraint(equalTo: widthAnchor, constant: -10),
            search.heightAnchor.constraint(equalToConstant: 50),
            search.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            searchButton.topAnchor.constraint(equalTo: search.topAnchor, constant: 10),
            searchButton.trailingAnchor.constraint(equalTo: search.trailingAnchor, constant: -10),
            searchButton.bottomAnchor.constraint(equalTo: search.bottomAnchor, constant: -10),
            searchButton.widthAnchor.constraint(equalToConstant: 30),
            
            cityName.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 20),
            cityName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            stateName.topAnchor.constraint(equalTo: cityName.bottomAnchor, constant: 10),
            stateName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            lineSep.topAnchor.constraint(equalTo: stateName.bottomAnchor, constant: 5),
            lineSep.leadingAnchor.constraint(equalTo: stateName.leadingAnchor),
            lineSep.trailingAnchor.constraint(equalTo: cityName.trailingAnchor, constant: 50),
            lineSep.heightAnchor.constraint(equalToConstant: 1),
            
            weatherLabel.topAnchor.constraint(equalTo: lineSep.bottomAnchor, constant: 10),
            weatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            
            highTempLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor),
            highTempLabel.heightAnchor.constraint(equalToConstant: 30),
            highTempLabel.leadingAnchor.constraint(equalTo: weatherLabel.leadingAnchor),
            
            highTemp.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor),
            highTemp.heightAnchor.constraint(equalToConstant: 30),
            highTemp.leadingAnchor.constraint(equalTo: highTempLabel.trailingAnchor),
            
            lowTempLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor),
            lowTempLabel.heightAnchor.constraint(equalToConstant: 30),
            lowTempLabel.leadingAnchor.constraint(equalTo: highTemp.trailingAnchor, constant: 15),
            
            lowTemp.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor),
            lowTemp.heightAnchor.constraint(equalToConstant: 30),
            lowTemp.leadingAnchor.constraint(equalTo: lowTempLabel.trailingAnchor),
            
            weatherImage.topAnchor.constraint(equalTo: lineSep.bottomAnchor, constant: -40),
            weatherImage.leadingAnchor.constraint(equalTo: weatherLabel.trailingAnchor, constant: 20),
        ])
    }

}
