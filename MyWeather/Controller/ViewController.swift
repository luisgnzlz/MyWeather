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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
  
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
               }
           }
           
           func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
               guard let locationValue : CLLocationCoordinate2D = manager.location?.coordinate else {
                   return
               }
               
               print("My location: \(locationValue.latitude)\(locationValue.longitude)")
               let lat = String(locationValue.latitude)
               let longi = String(locationValue.longitude)
               
               CLGeocoder().reverseGeocodeLocation(locations[0]) { (placemark, error) in
                   if error != nil {
                       print("Error")
                   }
                   else {
                       if let place = placemark?[0] {
                         //  guard let cityname = place.locality, let statename = place.administrativeArea else {
                         //      return
                         //  }
                           
                           
                           let setWeatherInfo:(WeatherResponse) -> Void = { currentWeather in
                               print(currentWeather.main.temp)
                            //   let icon = currentWeather.weather[0].icon
                               //self.apiWeather.getWeatherImage(iconName: icon, onCompletion: setWeatherIconImage)
                               DispatchQueue.main.async {
                                   //self.displayWeatherInfo(currentWeather: currentWeather)
                               }
                           }
                           
                           self.apiWeather.weatherInfo(longitude: longi, latitude: lat, onCompletion: setWeatherInfo)
                       }
                   }

               }
           }
}

