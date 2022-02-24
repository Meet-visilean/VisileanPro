//
//  signoutCell.swift
//  visileanPro
//
//  Created by Visilean Meet on 07/02/22.
//

import UIKit

class signoutCell: UITableViewCell {
    
    
    @IBOutlet var SignoutLBL: UILabel!
    static func nib()->UINib{
        return UINib(nibName: "signoutCell", bundle: nil)
        
    }
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
