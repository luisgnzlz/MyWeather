//
//  SearchPopUp.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 10/1/21.
//

import UIKit

class SearchPopUp: ProgramaticView {
    
    let searchBar = UISearchBar()

    override func configure() {
        backgroundColor = .white
        
        searchBar.autocorrectionType = .yes
        searchBar.showsCancelButton = true
        searchBar.placeholder = "City Name..."
        searchBar.backgroundImage = UIImage()
    }
    
    override func constrain() {
        addConstrainedSubviews(searchBar)
        
        NSLayoutConstraint.activate([
        
            searchBar.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchBar.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchBar.widthAnchor.constraint(equalTo: widthAnchor, constant: -12),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
