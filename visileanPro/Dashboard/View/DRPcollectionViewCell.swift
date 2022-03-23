//
//  DRPcollectionViewCell.swift
//  visileanPro
//
//  Created by Visilean Meet on 15/03/22.
//

import UIKit

class DRPcollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var mainView: UIView!
    

  
    @IBOutlet var TaskCountdrpLBL: UILabel!
    @IBOutlet var DetailLBL: UILabel!
    


    override func layoutSubviews() {
        mainView.layer.cornerRadius = 20
        mainView.addShadow(offset: CGSize.init(width: 2, height: 3), color: UIColor.black, radius: 3, opacity: 0.35)
    

        super.layoutSubviews()
      
        
    }
    

    
    
}
