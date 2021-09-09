//
//  SearchOptionView.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 9/9/21.
//

import UIKit

class SearchOptionView: ProgramaticView {

    let search = UITextField()
    
    override func configure() {
        search.backgroundColor = .gray
        search.placeholder = " Search"
        search.layer.cornerRadius = 5
        search.layer.masksToBounds = true
        search.font = UIFont.systemFont(ofSize: 24)
    }
    
    override func constrain() {
        addConstrainedSubviews(search)
        
        NSLayoutConstraint.activate([
        
            search.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            search.widthAnchor.constraint(equalTo: widthAnchor, constant: -10),
            search.heightAnchor.constraint(equalToConstant: 50),
            search.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
