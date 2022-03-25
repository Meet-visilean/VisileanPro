//
//  TaskTypeTableViewCell.swift
//  visileanPro
//
//  Created by Visilean Meet on 24/03/22.
//

import UIKit

class TaskTypeTableViewCell: UITableViewCell {

    @IBOutlet var TasknameLBL: UILabel!
    @IBOutlet var TaskIMG: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
