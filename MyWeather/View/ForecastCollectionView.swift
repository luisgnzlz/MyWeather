//
//  ForecastCollectionView.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 2/12/21.
//

import UIKit

class ForecastCollectionView: UICollectionView, UICollectionViewDataSource {
    
    let layoutForecast = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        layoutForecast.itemSize = CGSize(width: self.frame.width/5, height: self.frame.height)
        layoutForecast.scrollDirection = .horizontal
        
        self.register(UICollectionView.self, forCellWithReuseIdentifier: "Cell")
        
        self.setCollectionViewLayout(layoutForecast, animated: true)
        self.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .brown
        
        return cell
    }
    
    
}
