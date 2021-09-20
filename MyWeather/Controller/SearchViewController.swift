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
        
        view.backgroundColor = bgColor.withAlphaComponent(0.9)
        constrain()
    }
    
    func constrain() {
        view.addConstrainedSubviews(searchView)
        searchView.searchButton.addTarget(self, action: #selector(checkSearch), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            searchView.topAnchor.constraint(equalTo: view.topAnchor),
            searchView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            searchView.widthAnchor.constraint(equalTo: view.widthAnchor),
            searchView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func checkSearch() {
        guard let cityName = searchView.search.text else {
            return
        }
        searchStart(city: cityName)
    }
    
    func searchStart(city: String) {
        
        let cityDisplayName = city.replacingOccurrences(of: " ", with: "%20")
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
            self.apiWeather.weatherCityInfo(city: cityDisplayName, onCompletion: setWeatherInfo)
        
    }
    
    func weatherDisplay(weathers: WeatherResponse, cityName: String) {
        
        let currentTemp = Int(weathers.main.temp.rounded())
        
        searchView.weatherLabel.text = "\(currentTemp)°"
        searchView.cityName.text = "\(cityName.capitalized), "
        searchView.stateName.text = weathers.time.country
        searchView.highTemp.text = "\(Int(weathers.main.highTemp.rounded()))"
        searchView.lowTemp.text = "\(Int(weathers.main.lowTemp.rounded()))"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchView.search.resignFirstResponder()
        
        return true
    }
}
