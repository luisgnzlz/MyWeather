//
//  ForecastCollectionView.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 2/12/21.
//

import UIKit

class ForecastCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.setCollectionViewLayout(UICollectionViewFlowLayout, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
