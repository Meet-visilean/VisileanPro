//
//  LeaderboardTableViewCell.swift
//  visileanPro
//
//  Created by Visilean Meet on 21/03/22.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {

    @IBOutlet var tasklTypeLBL: UILabel!
    @IBOutlet var ScoreLBL: UILabel!
    @IBOutlet var NameLBL: UILabel!
    @IBOutlet var count: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
        
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
