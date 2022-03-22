//
//  LeaderBoardCDmanager.swift
//  visileanPro
//
//  Created by Visilean Meet on 17/03/22.
//

import Foundation


struct LeaderBoardMAnager{
    private let _LeaderBoarddataRepo = LeaderBoardDataRepo()
    
    func createTask(TaskListresult: TaskListResult,responsibleactor : ResponsibleActor) {
        _LeaderBoarddataRepo.adddata(TaskListresult: TaskListresult, responsibleactor: responsibleactor)
    }
    
    func fetchTask() -> [TaskListResultALL]? {
        return _LeaderBoarddataRepo.getall()
    }
    func getalltask(guid: String) ->TaskListResultALL?
    {
        return _LeaderBoarddataRepo.get(byIdentifier: guid)
    }
    
    func getlast7daydataGUIDwise(byIdentifier guid :String,startdate : Int,enddate : Int)-> Int
    {
        return _LeaderBoarddataRepo.gett(byIdentifier: guid, startdate: startdate, enddate: enddate)
    }

}
