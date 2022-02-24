//
//  TaskCollectionViewCell.swift
//  visileanPro
//
//  Created by Visilean Meet on 18/02/22.
//

import UIKit

class TaskCollectionViewCell: UICollectionViewCell,UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    }
    
    
}
