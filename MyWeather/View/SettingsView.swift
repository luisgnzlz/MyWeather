//
//  SettingsView.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 3/7/21.
//

import UIKit

class SettingsView: ProgramaticView {
    
    let vcTitleLabel = UILabel()
    let backgroundColorPickerButton = UIButton()
    let backgroundColorLabel = UILabel()
    let textColorPickerButton = UIButton()
    let textColorLabel = UILabel()
    
    override func configure() {
        settingsLabelTextConfig(backgroundColorLabel)
        
        vcTitleLabel.text = "Settings"
        vcTitleLabel.font = UIFont(name: fontNameLabel, size: 30)
        vcTitleLabel.textColor = .white
        
        backgroundColorPickerButton.setTitle("Change Background Color", for: .normal)
        backgroundColorPickerButton.setTitleColor(.white, for: .normal)
        backgroundColorPickerButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        backgroundColorPickerButton.layer.cornerRadius = 5
    }
    
    override func constrain() {
        addConstrainedSubviews(vcTitleLabel, backgroundColorPickerButton)
        
        NSLayoutConstraint.activate([
            vcTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            vcTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            backgroundColorPickerButton.topAnchor.constraint(equalTo: vcTitleLabel.bottomAnchor, constant: 15),
            backgroundColorPickerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundColorPickerButton.widthAnchor.constraint(equalToConstant: 300),
            backgroundColorPickerButton.heightAnchor.constraint(equalToConstant: 36),
        
        ])
    }
   
}
