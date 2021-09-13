//
//  SearchViewController.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 3/4/21.
//

import UIKit

class SearchViewController: UIViewController {

    let searchView = SearchOptionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        constrain()
    }
    
    func constrain() {
        view.addConstrainedSubviews(searchView)
        
        NSLayoutConstraint.activate([
            
            searchView.topAnchor.constraint(equalTo: view.topAnchor),
            searchView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            searchView.widthAnchor.constraint(equalTo: view.widthAnchor),
            searchView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func weatherDisplay(weathers: WeatherResponse, cityName: String, stateName: String) {
        
        let currentTemp = Int(weathers.main.temp.rounded())
        
        searchView.weatherLabel.text = "\(currentTemp)"
    }
    
}
