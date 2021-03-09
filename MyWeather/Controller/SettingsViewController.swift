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
        view.backgroundColor = pickedColor
        setUpVC()
    }
    
    func setUpVC() {
        view.addConstrainedSubviews(settingView)
        
        settingView.backgroundColorPickerButton.addTarget(self, action: #selector(selectColor), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            settingView.topAnchor.constraint(equalTo: view.topAnchor),
            settingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
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
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        print("Color Picker Controller Did Finish")
        super.presentingViewController?.view.backgroundColor = bgColor
        fontColor = bgColor
        ViewController().testChange()
    }

}
