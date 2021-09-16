//
//  SearchViewController.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 3/4/21.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {

    let searchView = SearchOptionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.9)
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchView.search.resignFirstResponder()
        
        return true
    }
}
