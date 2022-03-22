//
//  startlateManager.swift
//  visileanPro
//
//  Created by Visilean Meet on 16/03/22.
//

import Foundation

import CoreData

struct latestartmanager{
    private let _latestartDataRepo = latestartDataRepo()
    
    func createlatestartReason(latestartlistModel: latestartlistModel) {
        _latestartDataRepo.createlatestartReason(latestartlistModel: latestartlistModel)
    }
    func fetchTask() -> [latestartlistModel]? {
        return _latestartDataRepo.getall()
    }
    func get(byIdentifier guid: String) -> latestartlistModel?{
        _latestartDataRepo.get(byIdentifier: guid)
    }
}
