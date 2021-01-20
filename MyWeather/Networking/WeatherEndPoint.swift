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
    let API_Key = "01dfd7a79576fd7292bef57bfb4c1923"
    
    
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
    
}
