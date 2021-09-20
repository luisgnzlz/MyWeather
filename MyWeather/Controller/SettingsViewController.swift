//
//  SettingsViewController.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 3/4/21.
//

import UIKit

class SettingsViewController: UIViewController, UIColorPickerViewControllerDelegate {
    
    var settingView = SettingsView()
    var mainVC = ViewController()
    private var pickedColor = UIColor.systemTeal
    private var colorPicker = UIColorPickerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        colorPicker.delegate = self
        view.backgroundColor = .darkGray
        setUpVC()
    }
    
    func setUpVC() {
        view.addConstrainedSubviews(settingView)
        
        settingView.backgroundColorPickerButton.addTarget(self, action: #selector(selectColor), for: .touchUpInside)
        settingView.darkModeSwitcher.addTarget(self, action: #selector(darkModeFunc), for: .touchUpInside)
        settingView.restoreButton.addTarget(self, action: #selector(changeBack), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            settingView.topAnchor.constraint(equalTo: view.topAnchor),
            settingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func animateDarkMode(_ buttons: [UIButton], images: [UIImageView], views: [UIView]) {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.scale"
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 0.5
        
        buttons.forEach { button in
            button.layer.add(animation, forKey: "basic")
            button.layer.transform = CATransform3DMakeScale(0, 0, 1)
        }
        
        images.forEach { image in
            image.layer.add(animation, forKey: "basic")
            image.layer.transform = CATransform3DMakeScale(0, 0, 1)
        }
        
        views.forEach { lineView in
            lineView.layer.add(animation, forKey: "basic")
            lineView.layer.transform = CATransform3DMakeScale(0, 0, 1)
        }
    }
    
    func unAnimateDarkMode(_ buttons: [UIButton], images: [UIImageView], views: [UIView]) {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.scale"
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 0.5
        
        buttons.forEach { button in
            button.layer.add(animation, forKey: "undo")
            button.layer.transform = CATransform3DMakeScale(1, 1, 1)
        }
        
        images.forEach { image in
            image.layer.add(animation, forKey: "undo")
            image.layer.transform = CATransform3DMakeScale(1, 1, 1)
        }
        
        views.forEach { lineView in
            lineView.layer.add(animation, forKey: "undo")
            lineView.layer.transform = CATransform3DMakeScale(1, 1, 1)
        }
    
    }
    
    @objc func darkModeFunc() {
        if settingView.darkModeSwitcher.isOn {
            print("its on")
            settingView.darkModeSwitcher.isOn = true
            settingView.darkModeImage.image = UIImage(systemName: "moon.circle.fill")
            animateDarkMode([settingView.backgroundColorPickerButton,settingView.textColorPickerButton,settingView.restoreButton], images: [settingView.bgPickerImage,settingView.textPickerImage,settingView.restoreImage], views: [settingView.underBGColorView,settingView.underTColorView,settingView.underUndoView])
        } else {
            settingView.darkModeSwitcher.isOn = false
            settingView.darkModeImage.image = UIImage(systemName: "moon.circle")
            print("its off")
            unAnimateDarkMode([settingView.backgroundColorPickerButton,settingView.textColorPickerButton,settingView.restoreButton], images: [settingView.bgPickerImage,settingView.textPickerImage,settingView.restoreImage], views: [settingView.underBGColorView,settingView.underTColorView,settingView.underUndoView])
        }
    }
    
    @objc private func selectColor() {
        colorPicker.supportsAlpha = true
        colorPicker.selectedColor = pickedColor
        self.present(colorPicker, animated: true)
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        pickedColor = viewController.selectedColor
        bgColor = pickedColor
    }
    
    @objc func changeBack() {
        print("This is a test to see if it works and i will")
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        print("Color Picker Controller Did Finish")
        super.presentingViewController?.view.backgroundColor = bgColor
        fontColor = bgColor
        ViewController().testChange()
    }

}
