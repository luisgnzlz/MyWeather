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
    let underUndoView = UIView()
    let darkModeBool = true
    let darkModeImage = UIImageView()
    let darkModeSwitcher = UISwitch()
    let darkModeTitle = UILabel()
    let darkModeDescription = UILabel()
    let restoreButton = UIButton()
    let restoreImage = UIImageView()
    // allow dayly notifications var
    
    override func configure() {
        
        backgroundColorPickerButton.setTitle("Change Background Color", for: .normal)
        backgroundColorPickerButton.setTitleColor(.white, for: .normal)
        backgroundColorPickerButton.titleLabel?.font = UIFont(name: fontNameLabel, size: 20)
        backgroundColorPickerButton.layer.cornerRadius = 5
        
        bgPickerImage.image = UIImage(systemName: "eyedropper.full")
        bgPickerImage.tintColor = .white
        bgPickerImage.contentMode = .scaleAspectFit
        
        textPickerImage.image = UIImage(systemName: "textformat.alt")
        textPickerImage.tintColor = .white
        textPickerImage.contentMode = .scaleAspectFit
        
        darkModeTitle.text = "Dark Mode"
        darkModeTitle.font = UIFont(name: fontNameLabel, size: 20)
        darkModeTitle.textColor = .white
        
        darkModeDescription.text = "When Dark Mode is on, color customization will be disabled. Background color will change to dark gray and text color will become white. To enable customization, simply turn off Dark Mode"
        darkModeDescription.numberOfLines = 4
        darkModeDescription.font = UIFont(name: fontNameLabel, size: 12)
        darkModeDescription.textColor = .lightText
        
        darkModeImage.tintColor = .white
        darkModeImage.contentMode = .scaleAspectFit
        
        darkModeSwitcher.sizeToFit()
        
        darkModeImage.image = UIImage(systemName: "moon.circle.fill")
       
        viewScroller.backgroundColor = .lightGray
        viewScroller.layer.cornerRadius = 5
        
        restoreImage.image = UIImage(systemName: "arrow.uturn.backward")
        restoreImage.tintColor = .white
        restoreImage.contentMode = .scaleAspectFit
        
        restoreButton.setTitle("Restore Original Design", for: .normal)
        restoreButton.setTitleColor(.white, for: .normal)
        restoreButton.titleLabel?.font = UIFont(name: fontNameLabel, size: 20)
        restoreButton.layer.cornerRadius = 5
        
        underBGColorView.backgroundColor = .gray
        
        underTColorView.backgroundColor = .gray
        
        underUndoView.backgroundColor = .gray
        
        textColorPickerButton.setTitle("Change Text Color", for: .normal)
        textColorPickerButton.setTitleColor(.white, for: .normal)
        textColorPickerButton.titleLabel?.font = UIFont(name: fontNameLabel, size: 20)
        textColorPickerButton.layer.cornerRadius = 5
    }
    
    override func constrain() {
        addConstrainedSubviews(viewScroller, backgroundColorPickerButton, bgPickerImage, underBGColorView, textColorPickerButton, textPickerImage, underTColorView, restoreImage, restoreButton, darkModeTitle, underUndoView, darkModeSwitcher, darkModeImage, darkModeDescription)
        
        NSLayoutConstraint.activate([
            
            viewScroller.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            viewScroller.centerXAnchor.constraint(equalTo: centerXAnchor),
            viewScroller.widthAnchor.constraint(equalToConstant: 50),
            viewScroller.heightAnchor.constraint(equalToConstant: 5),
            
            bgPickerImage.topAnchor.constraint(equalTo: viewScroller.bottomAnchor, constant: 30),
            bgPickerImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            bgPickerImage.widthAnchor.constraint(equalToConstant: 30),
            bgPickerImage.heightAnchor.constraint(equalToConstant: 30),

            backgroundColorPickerButton.topAnchor.constraint(equalTo: viewScroller.bottomAnchor, constant: 30),
            backgroundColorPickerButton.leadingAnchor.constraint(equalTo: bgPickerImage.trailingAnchor, constant: 20),
            backgroundColorPickerButton.heightAnchor.constraint(equalToConstant: 20),
            
            underBGColorView.topAnchor.constraint(equalTo: backgroundColorPickerButton.bottomAnchor, constant: 15),
            underBGColorView.leadingAnchor.constraint(equalTo: backgroundColorPickerButton.leadingAnchor),
            underBGColorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            underBGColorView.heightAnchor.constraint(equalToConstant: 1),
            
            textPickerImage.topAnchor.constraint(equalTo: underBGColorView.bottomAnchor, constant: 10),
            textPickerImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            textPickerImage.widthAnchor.constraint(equalToConstant: 30),
            textPickerImage.heightAnchor.constraint(equalToConstant: 30),
            
            textColorPickerButton.topAnchor.constraint(equalTo: underBGColorView.bottomAnchor, constant: 15),
            textColorPickerButton.leadingAnchor.constraint(equalTo: textPickerImage.trailingAnchor, constant: 20),
            textColorPickerButton.heightAnchor.constraint(equalToConstant: 20),
            
            underTColorView.topAnchor.constraint(equalTo: textColorPickerButton.bottomAnchor, constant: 15),
            underTColorView.leadingAnchor.constraint(equalTo: textColorPickerButton.leadingAnchor),
            underTColorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            underTColorView.heightAnchor.constraint(equalToConstant: 1),
            
            restoreImage.topAnchor.constraint(equalTo: underTColorView.bottomAnchor, constant: 10),
            restoreImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            restoreImage.widthAnchor.constraint(equalToConstant: 30),
            restoreImage.heightAnchor.constraint(equalToConstant: 30),
            
            restoreButton.topAnchor.constraint(equalTo: underTColorView.bottomAnchor, constant: 15),
            restoreButton.leadingAnchor.constraint(equalTo: restoreImage.trailingAnchor, constant: 20),
            restoreButton.heightAnchor.constraint(equalToConstant: 20),
            
            underUndoView.topAnchor.constraint(equalTo: restoreButton.bottomAnchor, constant: 15),
            underUndoView.leadingAnchor.constraint(equalTo: restoreButton.leadingAnchor),
            underUndoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            underUndoView.heightAnchor.constraint(equalToConstant: 1),
            
            darkModeImage.topAnchor.constraint(equalTo: underUndoView.bottomAnchor, constant: 10),
            darkModeImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            darkModeImage.widthAnchor.constraint(equalToConstant: 30),
            darkModeImage.heightAnchor.constraint(equalToConstant: 30),
            
            darkModeTitle.topAnchor.constraint(equalTo: underUndoView.bottomAnchor, constant: 15),
            darkModeTitle.leadingAnchor.constraint(equalTo: darkModeImage.trailingAnchor, constant: 20),
            darkModeTitle.heightAnchor.constraint(equalToConstant: 20),
            
            darkModeSwitcher.topAnchor.constraint(equalTo: underUndoView.bottomAnchor, constant: 10),
            darkModeSwitcher.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            darkModeDescription.topAnchor.constraint(equalTo: darkModeTitle.bottomAnchor, constant: 10),
            darkModeDescription.leadingAnchor.constraint(equalTo: darkModeTitle.leadingAnchor),
            darkModeDescription.widthAnchor.constraint(equalToConstant: 300),
        
        ])
    }
   
}
