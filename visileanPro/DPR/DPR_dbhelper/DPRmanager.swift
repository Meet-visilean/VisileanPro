//
//  DPRmanager.swift
//  visileanPro
//
//  Created by Visilean Meet on 15/03/22.
//

import Foundation

import CoreData

struct DPRmanager{
    private let _DPRdatarepo = DPRdataRepo()
    
    func createDPR(DPRmodel: TaskListResult,acurrentdate : Int,latestartreason:String) {
        _DPRdatarepo.createDPR(DPRmodel: DPRmodel, currentdate: acurrentdate,latestartreason:latestartreason)
    }
    
  

    func updateTaskStauts(DPRmodel: DPRmodel) -> Bool {
        return _DPRdatarepo.updateStatusCode(DPRmodel: DPRmodel)
    }
   func getDprData(status : Int,startdate : Int,enddate : Int)-> Int
    {
        return _DPRdatarepo.get(byIdentifier: status,startdate : startdate,enddate : enddate)
    }
}
