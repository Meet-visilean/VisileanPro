//
//  LeaderboardCollectionViewCell.swift
//  visileanPro
//
//  Created by Visilean Meet on 21/03/22.
//

import UIKit

class LeaderboardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var NameCollLBL: UILabel!
    
    @IBOutlet var sepratorView: UIView!
    
    func changecolor()
    {
        sepratorView.backgroundColor = .darkGray

    }
}
