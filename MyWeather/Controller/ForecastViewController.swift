//
//  ForecastViewController.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 2/12/21.
//

import UIKit

class ForecastViewController: UIViewController {
    
    let forecast = ForecastCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forecast.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(forecast)
        
        forecast.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        forecast.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        forecast.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        forecast.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
    }
    

}
