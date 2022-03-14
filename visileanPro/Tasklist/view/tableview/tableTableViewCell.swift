//
//  tableTableViewCell.swift
//  visileanPro
//
//  Created by Visilean Meet on 18/02/22.
//

import UIKit

class tableTableViewCell: UITableViewCell{
    
@IBOutlet var startDataLBL: UILabel!
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var NameLBL: UILabel!
    @IBOutlet var StatusOftaskLBL: UILabel!
    @IBOutlet var locationLBL: UILabel!
    
    @IBOutlet var statusBTN: UIButton!
    
    
    override func awakeFromNib() {

        super.awakeFromNib()
        // Initialization code
        
        view1.layer.cornerRadius = 20
        view1.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner)
        
        view1.addShadow(offset: CGSize.init(width: 3, height: 3), color: UIColor.black, radius: 5.0, opacity: 0.35)
        statusBTN.layer.cornerRadius = 15
     
        statusBTN.addShadow(offset: CGSize.init(width: 2, height: 3), color: UIColor.black, radius: 3, opacity: 0.35)
        // Do any additional setup after loading the view.
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
