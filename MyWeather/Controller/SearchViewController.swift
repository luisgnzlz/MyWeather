//
//  SearchViewController.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 3/4/21.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    var apiWeather = WeatherAPI()
    let searchView = SearchOptionView()
    let otherView = OtherSearchOptionView()
    let scroll = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bgColor.withAlphaComponent(0.9)
        constrain()
    }
    
    func constrain() {
        self.searchView.search.delegate = self
        view.addConstrainedSubviews(searchView, scroll)
        scroll.addConstrainedSubviews(otherView)
        
       // searchView.searchButton.addTarget(self, action: #selector(checkSearch), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            searchView.topAnchor.constraint(equalTo: view.topAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 400),
            searchView.widthAnchor.constraint(equalTo: view.widthAnchor),
            searchView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scroll.topAnchor.constraint(equalTo: searchView.bottomAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            otherView.topAnchor.constraint(equalTo: scroll.topAnchor),
            otherView.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            otherView.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            otherView.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
            otherView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
        ])
    }
    
    func checkSearch() {
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
        
        let progressNumber = Float(weathers.main.humidity)
        let feelTemp = Int(weathers.main.feels_like.rounded())
        let windInfo = Int(weathers.wind.speed.rounded())
        let sunset = weathers.time.sunset
        let sunsetTime = sunsetSunriseTimeSet(convertTime: Double(sunset))
        let sunrise = weathers.time.sunrise
        let lowTemp = Int(weathers.main.lowTemp.rounded())
        let highTemp = Int(weathers.main.highTemp.rounded())
        let sunriseTime = sunsetSunriseTimeSet(convertTime: Double(sunrise))
        let windDir = windLocation(weathers.wind.degree)
        let descrip = weathers.weather[0].description.capitalized
        let currentTemp = Int(weathers.main.temp.rounded())
        
        let progNum = progressNumber/100
        UIView.animate(withDuration: 4) {
            self.otherView.humidityBar.setValue(progNum, animated: true)
        }
        
        searchView.weatherLabel.text = "\(currentTemp)°"
        searchView.cityName.text = "\(cityName.capitalized), "
        searchView.stateName.text = weathers.time.country
        searchView.highTemp.text = "\(Int(weathers.main.highTemp.rounded()))"
        searchView.lowTemp.text = "\(Int(weathers.main.lowTemp.rounded()))"
        
        self.otherView.windInfo.text = "\(windDir) \(windInfo) mph"
        self.otherView.feelsLike.text = "\(feelTemp)°"
        self.otherView.weatherDescrip.text = "\(descrip) today. Forecast shows a high of \(highTemp)° and low of \(lowTemp)°"
        self.otherView.sunrise.text = "\(sunriseTime)am"
        self.otherView.sunset.text = "\(sunsetTime)pm"
        self.otherView.humidityNumber.text = "\(weathers.main.humidity)%"
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        self.searchStart(city: searchView.search.text!)
        self.searchView.search.endEditing(true)
    }

}
