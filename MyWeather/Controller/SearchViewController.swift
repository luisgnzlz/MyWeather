//
//  SearchViewController.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 3/4/21.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {

    var apiWeather = WeatherAPI()
    let searchView = SearchOptionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.9)
        constrain()
    }
    
    func constrain() {
        view.addConstrainedSubviews(searchView)
        searchView.searchButton.addTarget(self, action: #selector(searchStart), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            searchView.topAnchor.constraint(equalTo: view.topAnchor),
            searchView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            searchView.widthAnchor.constraint(equalTo: view.widthAnchor),
            searchView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func searchStart() {
        let setImageWeatherIcon:(UIImage) -> Void = { iconWeatherImage in
            DispatchQueue.main.async {
                self.searchView.weatherImage.image = iconWeatherImage
            }
        }
        
        let setWeatherInfo:(WeatherResponse) -> Void = { currentWeather in
            let weatherIcon = currentWeather.weather[0].icon
            self.apiWeather.weatherImageIcon(weatherIcon: weatherIcon, onCompletion: setImageWeatherIcon)
        DispatchQueue.main.async {
            self.weatherDisplay(weathers: currentWeather, cityName: self.searchView.search.text!)
        }
        }
            self.apiWeather.weatherCityInfo(city: self.searchView.search.text ?? "Hesperia", onCompletion: setWeatherInfo)
        
    }
    
    func weatherDisplay(weathers: WeatherResponse, cityName: String) {
        
        let currentTemp = Int(weathers.main.temp.rounded())
        
        searchView.weatherLabel.text = "\(currentTemp)"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchView.search.resignFirstResponder()
        
        return true
    }
}
