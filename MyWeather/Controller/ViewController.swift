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
    
    func didTabButton(progressNumber: Float, weather: WeatherResponse) {
        mainView.mainTemp.mainTemp.text = "\(weather.main.temp)"
       // mainView.mainTemp.cityName.text = "\()"
       // mainView.mainTemp.countryName.text = "\()"
        
        let progNum = progressNumber/100
        UIView.animate(withDuration: 4) {
            print("this is a good thing")
            self.mainView.otherWeatherInfo.humidityBar.setProgress(progNum, animated: true)
        }
        self.mainView.otherWeatherInfo.humidityNumber.text = "\(weather.main.humidity)%"
        
    }
           
           func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
               guard let locationValue : CLLocationCoordinate2D = manager.location?.coordinate else {
                   return
               }
               
               let lat = String(locationValue.latitude)
               let longi = String(locationValue.longitude)
               CLGeocoder().reverseGeocodeLocation(locations[0]) { (placemark, error) in
                   if error != nil {
                       print("Error")
                   }
                   else {
                       if let place = placemark?[0] {
                           guard let cityname = place.locality, let statename = place.administrativeArea else {
                               return
                           }
                           
                           let setWeatherInfo:(WeatherResponse) -> Void = { currentWeather in
                               
                               DispatchQueue.main.async {
                                print("start")
                                self.didTabButton(progressNumber: Float(currentWeather.main.temp), weather: currentWeather)
                                print("end")
                                   //self.displayWeatherInfo(currentWeather: currentWeather)
                               }
                           }
                           self.apiWeather.weatherInfo(longitude: longi, latitude: lat, onCompletion: setWeatherInfo)
                       }
                   }

               }
           }
}

