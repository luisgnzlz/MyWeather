//
//  ViewController.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 1/19/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var apiWeather = WeatherAPI()
    var maintempInfo = MainTempInfo()
    lazy var contentView : otherWInfo = .init()
    lazy var mainView = MainWeatherView()

    override func loadView() {
        view = mainView

        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
           }
    
    func didTabButton(weathers: WeatherResponse, cityName: String, stateName: String) {
        let progressNumber = Float(weathers.main.humidity)
        let currentTemp = Int(weathers.main.temp.rounded())
        let lowerTemp = Int(weathers.main.lowTemp.rounded())
        let higherTemp = Int(weathers.main.highTemp.rounded())
        let sunset = weathers.time.sunset
        let sunsetTime = sunsetSunriseTimeSet(convertTime: Double(sunset))
        let sunrise = weathers.time.sunrise
        let sunriseTime = sunsetSunriseTimeSet(convertTime: Double(sunrise))
        
        mainView.mainTemp.mainTemp.text = "\(currentTemp)°"
        mainView.mainTemp.cityAndState.text = "\(cityName)"
        
        let progNum = progressNumber/100
        UIView.animate(withDuration: 4) {
            self.mainView.otherWeatherInfo.humidityBar.setProgress(progNum, animated: true)
        }
        self.mainView.otherWeatherInfo.lowTemp.text = "Low: \(lowerTemp)°"

        self.mainView.otherWeatherInfo.highTemp.text = "High: \(higherTemp)°"

        self.mainView.otherWeatherInfo.windSpeed.text = "Wind Speed: "

        self.mainView.otherWeatherInfo.windDegree.text = "Wind Degree: "

        self.mainView.otherWeatherInfo.weatherDescrip.text = "Description: \(weathers.weather[0].description.capitalized)"
        
        self.mainView.otherWeatherInfo.sunrise.text = "Sunrise: \(sunriseTime)am"
        
        self.mainView.otherWeatherInfo.sunset.text = "Set: \(sunsetTime)pm"
        
        self.mainView.otherWeatherInfo.humidityNumber.text = "\(weathers.main.humidity)%"
        
    }
    
    func sunsetSunriseTimeSet(convertTime: Double) -> String {
            let sunsetDate = Date(timeIntervalSince1970: Double(convertTime))
            let sunsetDateFormatter = DateFormatter()
            sunsetDateFormatter.timeZone = TimeZone(abbreviation: "UTC/GMT")
            sunsetDateFormatter.locale = NSLocale.current
            sunsetDateFormatter.dateFormat = "hh:mm"
            let sunsetData = sunsetDateFormatter.string(from: sunsetDate)
            return sunsetData
        }
           
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locationValue : CLLocationCoordinate2D = manager.location?.coordinate else {
            return
               }
               
        let lat = String(locationValue.latitude)
        let longi = String(locationValue.longitude)
            
        CLGeocoder().reverseGeocodeLocation(locations[0]) { (placemark, error) in
            if error != nil {
                print("Error1111")
            }
            else {
                if let place = placemark?[0] {
                    guard let cityname = place.locality, let statename = place.administrativeArea else {
                        return
                    }
                           
            let setWeatherInfo:(WeatherResponse) -> Void = { currentWeather in
                               
    DispatchQueue.main.async {
            self.didTabButton(weathers: currentWeather, cityName: cityname, stateName: statename)
    }
        }
                    self.apiWeather.weatherInfo(longitude: longi, latitude: lat, onCompletion: setWeatherInfo)
                }
            }

        }
    }
}

