//
//  TaskListRequestModel.swift
//  visileanPro
//
//  Created by Visilean Meet on 01/03/22.
//

import Foundation


struct TaskListRequestModel:Encodable{
    let actorGUID :String
    let startDate : Int64
    let endDate : Int64
}

