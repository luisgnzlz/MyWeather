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
    
    func forecastHeader(_ views: UILabel...) {
        views.forEach { view in
            view.font = UIFont(name: fontNameLabel, size: 20)
            view.textColor = fontColor
            view.textAlignment = .center
        }
    }
    
    func forecastFooter(_ views: UILabel...) {
        views.forEach { view in
            view.font = UIFont(name: fontNameLabel, size: 12)
            view.textColor = fontColor
            view.textAlignment = .center
        }
    }
    
    func weatherInfoTextConfig(_ views: UILabel...) {
        views.forEach { view in
            view.font = UIFont(name: fontNameLabel, size: 24)
            view.textColor = fontColor
        }
    }
    
    func weatherInfoTextConfigLabel(_ views: UILabel...) {
        views.forEach { view in
            view.font = UIFont(name: fontNameLabel, size: 16)
            view.textColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.7)
            view.textAlignment = .center
        }
    }
    
    func settingsLabelTextConfig(_ views: UILabel...) {
        views.forEach { view in
            view.font = UIFont(name: fontNameLabel, size: 20)
            view.textColor = fontColor
        }
    }
    
    func lineSepHelp(_ views: UIView...) {
        views.forEach { view in
            view.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.4)
        }
    }
    
    func changedTextColor(_ views: UILabel...) {
        views.forEach { view in
            view.textColor = fontColor
        }
    }
}
