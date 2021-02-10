//
//  testViewController.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 2/9/21.
//

import UIKit

class testViewController: UIViewController {
    
    let forecast = FiveDayForcast()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }

    
    func setUp() {
        forecast.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(forecast)
        
        forecast.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        forecast.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        forecast.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        forecast.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    }
}
