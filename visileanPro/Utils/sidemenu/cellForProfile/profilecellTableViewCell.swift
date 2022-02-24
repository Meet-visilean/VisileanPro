//
//  profilecellTableViewCell.swift
//  visileanPro
//
//  Created by Visilean Meet on 03/02/22.
//

import UIKit

class profilecellTableViewCell: UITableViewCell {
    
    @IBOutlet var myIMG : UIImageView!
    @IBOutlet var UserNameLBL: UILabel!
    static func nib()->UINib{
        return UINib(nibName: "profilecellTableViewCell", bundle: nil)
        
    }
    //MARK: - for profile pic
    //    public func configure(with imageName : String){
    //        myIMG.image = UIImage(named:imageName)
    //
    //    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
