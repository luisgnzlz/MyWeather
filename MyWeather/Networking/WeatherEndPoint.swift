//
//  WeatherEndPoint.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 1/19/21.
//

import Foundation
import UIKit

final class WeatherAPI {
    
    let session = URLSession.shared
    let baseUrl = "https://api.openweathermap.org"
    let imageUrl = "https://openweathermap.org/img/wn/"
    let API_Key = "01dfd7a79576fd7292bef57bfb4c1923"
    
    
    func weatherImageIcon(weatherIcon: String, onCompletion: @escaping (UIImage) -> Void) {
        let imageEndUrl = "\(weatherIcon)@4x.png"
        guard let urlImage = URL(string: "\(imageUrl)\(imageEndUrl)") else { return }
        
        session.dataTask(with: urlImage) { (data, response, err) in
            guard let data = data else { return }
                guard let iconImage = UIImage(data: data) else {return}
                onCompletion(iconImage)
        }.resume()
    }
    
    func weatherInfo(longitude: String, latitude: String,  onCompletion: @escaping (WeatherResponse) -> Void) {
            let urlDetails = "/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&units=imperial&APPID=\(API_Key)"
            guard let url = URL(string: baseUrl + urlDetails) else { return }
            session.dataTask(with: url) { (data, response, err) in
                guard let data = data else { return }
                do {
                    let weather = try
                            JSONDecoder().decode(WeatherResponse.self, from: data)
                    print(weather)
                    onCompletion(weather)
                } catch let jsonErr {
                    print(jsonErr)
                }
            }.resume()
        }
    
    func forecastWeatherInfo(longitude: String, latitude: String, onCompletion: @escaping (ForecastList) -> Void) {
        let urlDetials = "/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&units=imperial&APPID=\(API_Key)"
        guard let url = URL(string: baseUrl + urlDetials) else { return }
        session.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do {
                let forecastWeather = try
                    JSONDecoder().decode(ForecastList.self, from: data)
                print(forecastWeather)
                onCompletion(forecastWeather)
            } catch let jsonErr {
                print(jsonErr)
            }
        }.resume()
    }
    
    func searchForecastWeatherInfo(cityName: String, onCompletion: @escaping (ForecastList) -> Void) {
        let urlDetials = "/data/2.5/forecast?q=\(cityName)&units=imperial&appid=\(API_Key)"
        guard let url = URL(string: baseUrl + urlDetials) else { return }
        session.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do {
                let forecastWeather = try
                    JSONDecoder().decode(ForecastList.self, from: data)
                print(forecastWeather)
                onCompletion(forecastWeather)
            } catch let jsonErr {
                print(jsonErr)
            }
        }.resume()
    }
    
    func weatherCityInfo(city: String, onCompletion: @escaping (WeatherResponse) -> Void) {
        let urlDetails = "/data/2.5/weather?q=\(city)&units=imperial&appid=\(API_Key)"
        guard let url = URL(string: baseUrl + urlDetails) else { return }
        session.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do {
                let weather = try
                        JSONDecoder().decode(WeatherResponse.self, from: data)
                //print(weather)
                onCompletion(weather)
            } catch let jsonErr {
                print(jsonErr)
            }
        }.resume()
    }
    
}
