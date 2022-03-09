//
//  GLB.swift
//  visileanPro
//
//  Created by Visilean Meet on 07/03/22.
//

import Foundation

class selectedTaskDetail {
    
    //creates the instance and guarantees that it's unique
    static let instance = selectedTaskDetail()
    
    private init() {
        }
        
    var selectedTask : String = ""
}
