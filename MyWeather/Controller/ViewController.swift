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
    lazy var contentView : testAnimations = .init()

    override func loadView() {
        view = contentView

        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
           }
    
    func didTabButton(progressNumber: Float) {
        print(progressNumber)
        let progNum = progressNumber/100
        UIView.animate(withDuration: 4) {
            self.contentView.humidityBar.setProgress(progNum, animated: true)
        }
        self.contentView.humidityNumber.text = "\(progressNumber)%"
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
                               print(currentWeather.main.temp)
                               DispatchQueue.main.async {
                                self.didTabButton(progressNumber: Float(currentWeather.main.temp))
                                   //self.displayWeatherInfo(currentWeather: currentWeather)
                               }
                           }
                           self.apiWeather.weatherInfo(longitude: longi, latitude: lat, onCompletion: setWeatherInfo)
                       }
                   }

               }
           }
}

