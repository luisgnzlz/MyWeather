//
//  SettingsView.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 3/7/21.
//

import UIKit

class SettingsView: ProgramaticView {
    
    let colorPickerButton = UIButton()
    
    override func configure() {
        colorPickerButton.setBackgroundImage(UIImage(systemName: "eyedropper"), for: .normal)
        colorPickerButton.tintColor = .white
        colorPickerButton.contentMode = .scaleAspectFill
    }
    
    override func constrain() {
        addConstrainedSubviews(colorPickerButton)
        
        NSLayoutConstraint.activate([
            colorPickerButton.topAnchor.constraint(equalTo: topAnchor),
            colorPickerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            colorPickerButton.widthAnchor.constraint(equalToConstant: 20),
            colorPickerButton.heightAnchor.constraint(equalToConstant: 20),
        
        ])
    }
   
}
