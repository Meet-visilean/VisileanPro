//
//  TaskCell.swift
//  visileanPro
//
//  Created by Visilean Meet on 18/02/22.
//

import Foundation
import UIKit

class TaskCell : UICollectionViewCell{
  
    override init(frame : CGRect){
        
    super.init(frame: frame)
    backgroundColor = .yellow
    }
    required init?(coder: NSCoder) {
        fatalError("Error in Init")
    }
}
