//
//  SettingsView.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 3/7/21.
//

import UIKit

class SettingsView: ProgramaticView {

    let viewScroller = UIView()
    let backgroundColorPickerButton = UIButton()
    let textColorPickerButton = UIButton()
    let bgPickerImage = UIImageView()
    let textPickerImage = UIImageView()
    let underBGColorView = UIView()
    let underTColorView = UIView()
    
    override func configure() {
        
        backgroundColorPickerButton.setTitle("Change Background Color", for: .normal)
        backgroundColorPickerButton.setTitleColor(.white, for: .normal)
        backgroundColorPickerButton.layer.cornerRadius = 5
        
        bgPickerImage.image = UIImage(systemName: "eyedropper.full")
        bgPickerImage.tintColor = .white
        bgPickerImage.contentMode = .scaleAspectFill
        
        textPickerImage.image = UIImage(systemName: "textformat.alt")
        textPickerImage.tintColor = .white
        textPickerImage.contentMode = .scaleAspectFill
        
        viewScroller.backgroundColor = .lightGray
        viewScroller.layer.cornerRadius = 5
        
        underBGColorView.backgroundColor = .gray
        
        underTColorView.backgroundColor = .gray
        
        textColorPickerButton.setTitle("Change Text Color", for: .normal)
        textColorPickerButton.setTitleColor(.white, for: .normal)
        textColorPickerButton.layer.cornerRadius = 5
    }
    
    override func constrain() {
        addConstrainedSubviews(viewScroller, backgroundColorPickerButton, bgPickerImage, underBGColorView, textColorPickerButton, textPickerImage, underTColorView)
        
        NSLayoutConstraint.activate([
            
            viewScroller.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            viewScroller.centerXAnchor.constraint(equalTo: centerXAnchor),
            viewScroller.widthAnchor.constraint(equalToConstant: 50),
            viewScroller.heightAnchor.constraint(equalToConstant: 5),
            
            bgPickerImage.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            bgPickerImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            bgPickerImage.widthAnchor.constraint(equalToConstant: 25),
            bgPickerImage.heightAnchor.constraint(equalToConstant: 25),

            backgroundColorPickerButton.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            backgroundColorPickerButton.leadingAnchor.constraint(equalTo: bgPickerImage.trailingAnchor, constant: 20),
            backgroundColorPickerButton.heightAnchor.constraint(equalToConstant: 30),
            
            underBGColorView.topAnchor.constraint(equalTo: backgroundColorPickerButton.bottomAnchor, constant: 5),
            underBGColorView.leadingAnchor.constraint(equalTo: backgroundColorPickerButton.leadingAnchor),
            underBGColorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            underBGColorView.heightAnchor.constraint(equalToConstant: 1),
            
            textPickerImage.topAnchor.constraint(equalTo: underBGColorView.bottomAnchor, constant: 10),
            textPickerImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            textPickerImage.widthAnchor.constraint(equalToConstant: 25),
            textPickerImage.heightAnchor.constraint(equalToConstant: 25),
            
            textColorPickerButton.topAnchor.constraint(equalTo: backgroundColorPickerButton.bottomAnchor, constant: 15),
            textColorPickerButton.leadingAnchor.constraint(equalTo: textPickerImage.trailingAnchor, constant: 20),
            textColorPickerButton.heightAnchor.constraint(equalToConstant: 30),
            
            underTColorView.topAnchor.constraint(equalTo: textColorPickerButton.bottomAnchor, constant: 5),
            underTColorView.leadingAnchor.constraint(equalTo: textColorPickerButton.leadingAnchor),
            underTColorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            underTColorView.heightAnchor.constraint(equalToConstant: 1),
        
        ])
    }
   
}
