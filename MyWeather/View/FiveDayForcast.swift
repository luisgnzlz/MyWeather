//
//  FiveDayForcast.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 2/9/21.
//

import UIKit

class FiveDayForcast: UICollectionView, UICollectionViewDataSource {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewFlowLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        let forecastLayout = UICollectionViewFlowLayout()
        forecastLayout.scrollDirection = .horizontal
        forecastLayout.itemSize = CGSize(width: 100, height: 100)
        collectionViewLayout = forecastLayout
        
        self.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
        
        
        self.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = self.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath)
        collectionCell.backgroundColor = .red
        return collectionCell
    }
    

    
}
