//
//  TaskListVM.swift
//  visileanPro
//
//  Created by Visilean Meet on 01/03/22.
//

import Foundation
import SwiftyJSON

//protocol ProjectViewModelDelegate {
//    func didReceiveProjectResponse(response: ProjectResponse?)
//}
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
                    if resultArr.result.count > 0
                    {
                        let TaskListOBJ = TaskListResult.init(data: resultArr.result[0])
                        print(TaskListOBJ.responsibleactor["name"]!)
                
                        manager.createTask(TaskListresult: TaskListOBJ)
                        //else
                        
//                        TaskListData =  manager.fetchTask()
//                        if([TaskListData].isEmpty)
//                        {
//                            manager.createTask(TaskListresult: TaskListOBJ)
//                        }

                    }
                }
            case.failure(let err):
                print(err.localizedDescription)
             
            }
            
        }
    }
}
