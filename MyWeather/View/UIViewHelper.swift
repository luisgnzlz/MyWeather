//
//  UIViewHelper.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 1/20/21.
//

import UIKit

extension UIView {
    
    func addConstrainedSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    
    func addConstrainedSubviews(_ views: UIView...) {
        views.forEach {
            view in addConstrainedSubview(view)
        }
    }
    
    func weatherInfoTextConfig(_ views: UILabel...) {
        views.forEach { view in
            view.font = UIFont(name: "Rockwell-BoldItalic", size: 20)
            view.textColor = .white
        }
    }
    
    func weatherInfoTextConfigLabel(_ views: UILabel...) {
        views.forEach { view in
            view.font = UIFont(name: "Rockwell-BoldItalic", size: 20)
            view.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.6)
        }
    }
    
    func lineSepHelp(_ views: UIView...) {
        views.forEach { view in
            view.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.4)
        }
    }
}
