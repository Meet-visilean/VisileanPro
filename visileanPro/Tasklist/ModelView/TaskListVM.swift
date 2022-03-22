//
//  TaskListVM.swift
//  visileanPro
//
//  Created by Visilean Meet on 01/03/22.
//

import Foundation
import SwiftyJSON


struct TaskListVM{
    //  var delegate : ProjectViewModelDelegate?
    
    private let manager: TaskListManager = TaskListManager()
    
    func callTaskListApi()
    {
        var _ : [TaskListResult]? = nil
        let startDate = ((Int(Date().millisecondsSince1970)) - 2629800000)
        
        //2629800000 = 30 days
        let endDate = Date().millisecondsSince1970
        let model = TaskListRequestModel.init(actorGUID: UserDefaults.standard.object(forKey: "userGUIDUserDefault") as? String ?? "", startDate: Int64(startDate), endDate: endDate)
        
        APImanager.sharedInstance.TaskListApicall(param: model){(result) in
            switch result{
            case.success(let json):
                let resultArr  = TaskListResponseModel.init(data: JSON(rawValue: json!) ?? "JSON")
                if resultArr.status == 1
                {
                    var i = 0
                    var temp = (resultArr.result.count)
                    while(temp != 0)
                    {
                        let TaskListOBJ = TaskListResult.init(data: resultArr.result[i])
                      var res = ResponsibleActor.init(data: JSON(rawValue: TaskListOBJ.responsibleactor) ?? 0)
                
                        let cddata =  manager.fetchTask()
                        if cddata?.count != 0
                        {
                            let taskdata = get(byIdentifier: TaskListOBJ.guid)
                            if taskdata?.guid == nil
                            {
                                print("specific add data to coredata")
                                manager.createTask(TaskListresult: TaskListOBJ)
                            }
                        }
                        else
                        {
                            print("First Time add data to coredata")
                            manager.createTask(TaskListresult: TaskListOBJ)
                        }
                        temp = temp - 1
                        i = i + 1
                    }
                }
            case.failure(let err):
                print(err.localizedDescription)
                
            }
            
        }
    }

}
