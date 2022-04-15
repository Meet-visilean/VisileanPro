//
//  LeaderBoardVM.swift
//  visileanPro
//
//  Created by Visilean Meet on 17/03/22.
//

import Foundation



import SwiftyJSON
import UIKit
//allcompletedtask
var skip = 1
let leaderboard = LeaderBoard()
class LeaderBoardVM{
    
    private let manager: LeaderBoardMAnager = LeaderBoardMAnager()
    func startLoader(){SceneDelegate.ActivityIndicatorWithLabel.shared.showProgressView()
        print("StartLoader-LeaderBoard")
    }
    func StopLoader(){SceneDelegate.ActivityIndicatorWithLabel.shared.hideProgressView()
        print("stoploader-LeaderBoard")
    }
    
    var i = 0
    
    func callallcompletetaskAPI() -> Int
    {
        
        if(i == 0){
            startLoader()
        }
        
        
        APImanager.sharedInstance.allcompletedtask(skip :skip ){(result) in
            switch result{
            case.success(let json):
                let resultArr = responseArrayLeaderboard.init(data: JSON(rawValue: json!) ?? "JSON")
                if resultArr.status == 1
                {
                    if(resultArr.result.count != 0 )
                    {
                        //add data to CoreDB
                        self.i = self.i + 1
                        self.callallcompletetaskAPI()
                        
                        self.adddatatoCD(resultArr :resultArr)
                        
                        skip = skip + 1
                    }
                    else if(resultArr.result.count == 0){
                        self.StopLoader()
                        
                        //when resultarray is empty END loop
                        
                    }
                    
                }
            case.failure(let err):
                print(err.localizedDescription)
                self.StopLoader()
            }
        }
        return skip
        
    }
    
    func adddatatoCD(resultArr:responseArrayLeaderboard){
        
        var i = 0
        var temp = (resultArr.result.count)
        while(temp != 0)
        {
            let TaskListOBJ = TaskListResult.init(data: resultArr.result[i])
            let resOBJ = ResponsibleActor.init(data: JSON(rawValue: TaskListOBJ.responsibleactor) ?? 0)
            
            let cddata =  manager.fetchTask()
            if cddata?.count != 0
            {
                let taskdata = manager.getalltask(guid: TaskListOBJ.guid)
                if taskdata?.guid == nil
                {
                    print("specific add data to coredata")
                    manager.createTask(TaskListresult: TaskListOBJ, responsibleactor: resOBJ)
                }
            }
            else
            {
                print("First Time add data to coredata")
                manager.createTask(TaskListresult: TaskListOBJ, responsibleactor: resOBJ)
            }
            temp = temp - 1
            i = i + 1
        }
    }
    //find actorGuid and store in array
    func findallactorList()->([String],[String:String],[String])
    {
        var actorarrayDict = [String : String ]()
        var guidarray : [String] = []
        var namactor : [String] = []
        
        var i = 0
        let alldata = manager.fetchTask()
        var totalNo = alldata?.count
        while(totalNo != 0 )
        {
            if(guidarray.count == 0)
            {
                actorarrayDict.updateValue(alldata![i].actorname, forKey:alldata![i].actorguid)
                guidarray.append(alldata![i].actorguid)
                namactor.append(alldata![i].actorname)
            }
            else
            {
                if(guidarray.contains(alldata![i].actorguid)){
                    print("alredy actor exist")
                }
                else{
                    guidarray.append(alldata![i].actorguid)
                    actorarrayDict.updateValue(alldata![i].actorname, forKey:alldata![i].actorguid)
                    namactor.append(alldata![i].actorname)
                }
            }
            totalNo = totalNo! - 1
            i = i + 1
        }
        return (guidarray,actorarrayDict,namactor)
    }
    
    //guid and date wise search from coreDB
    
    func guidbydataofCompletedtask(startdate : Int,enddate : Int,arrayOfactor:[String])->[String : Int]
    {
        var i = 1
        var dictionary = [String : Int]()
        //dictionary.updateValue("egf", forKey: 3)
        var temp = arrayOfactor.count - 1
        while(temp != 0)
        {
            let val =  manager.getlast7daydataGUIDwise(byIdentifier:arrayOfactor[i], startdate: startdate, enddate:enddate)
            dictionary.updateValue(val, forKey:arrayOfactor[i])
            i = i + 1
            temp = temp - 1
            
        }
        return dictionary
    }
    
}

