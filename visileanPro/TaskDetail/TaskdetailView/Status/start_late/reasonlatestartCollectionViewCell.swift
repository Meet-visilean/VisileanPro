//
//  reasonlatestartCollectionViewCell.swift
//  visileanPro
//
//  Created by Visilean Meet on 09/03/22.
//

import UIKit

class reasonlatestartCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var deleteBTN: customBTN!
    @IBOutlet var tagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = tagLabel.frame.size.height / 2.0
        self.backgroundColor = .lightGray
        self.tagLabel.textColor = .black
    }
}
