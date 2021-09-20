//
//  SearchOptionView.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 9/9/21.
//

import UIKit

class SearchOptionView: ProgramaticView {

    let search = UITextField()
    let searchButton = UIButton()
    let weatherLabel = UILabel()
    let weatherImage = UIImageView()
    let cityName = UILabel()
    let stateName = UILabel()
    let lineSep = UIView()
    
    override func configure() {
        
        cityName.font = UIFont.boldSystemFont(ofSize: 30)
        cityName.text = "Hesperia, "
        
        stateName.font = UIFont.boldSystemFont(ofSize: 30)
        stateName.text = "CA"
        
        lineSep.backgroundColor = .black
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        
        search.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.9)
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
        weatherLabel.textColor = .gray
        weatherLabel.shadowColor = .black
        weatherLabel.textAlignment = .center
        weatherLabel.text = "--°"
        
        weatherImage.contentMode = .scaleAspectFill
    }
    
    override func constrain() {
        addConstrainedSubviews(cityName, stateName, lineSep, search, searchButton, weatherLabel, weatherImage)
        
        NSLayoutConstraint.activate([
        
            search.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            search.widthAnchor.constraint(equalTo: widthAnchor, constant: -10),
            search.heightAnchor.constraint(equalToConstant: 50),
            search.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            searchButton.topAnchor.constraint(equalTo: search.topAnchor, constant: 10),
            searchButton.trailingAnchor.constraint(equalTo: search.trailingAnchor, constant: -10),
            searchButton.bottomAnchor.constraint(equalTo: search.bottomAnchor, constant: -10),
            searchButton.widthAnchor.constraint(equalToConstant: 30),
            
            cityName.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 20),
            cityName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            stateName.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 20),
            stateName.leadingAnchor.constraint(equalTo: cityName.trailingAnchor),
            
            lineSep.topAnchor.constraint(equalTo: cityName.bottomAnchor, constant: 5),
            lineSep.leadingAnchor.constraint(equalTo: cityName.leadingAnchor),
            lineSep.trailingAnchor.constraint(equalTo: stateName.trailingAnchor, constant: 50),
            lineSep.heightAnchor.constraint(equalToConstant: 1),
            
            weatherLabel.topAnchor.constraint(equalTo: cityName.bottomAnchor, constant: 20),
            weatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            
            weatherImage.topAnchor.constraint(equalTo: cityName.bottomAnchor, constant: 20),
            weatherImage.leadingAnchor.constraint(equalTo: weatherLabel.trailingAnchor, constant: 20),
        ])
    }

}
