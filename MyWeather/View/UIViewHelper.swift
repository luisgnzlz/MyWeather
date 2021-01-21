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
}
