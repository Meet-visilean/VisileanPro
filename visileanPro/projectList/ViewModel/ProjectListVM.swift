//
//  DashBoadViewVm.swift
//  visileanPro
//
//  Created by Visilean Meet on 28/02/22.
//

import Foundation
import SwiftyJSON
import UIKit

protocol ProjectViewModelDelegate {
    func didReceiveProjectResponse(response: ProjectResponse?)
}
struct ProjectListVM{
    var delegate : ProjectViewModelDelegate?
    func callProjectListing()
    {
        let model = projectListRequestModel.init(actorGUID: UserDefaults.standard.object(forKey: "userGUIDUserDefault") as? String ?? "")
        APImanager.sharedInstance.callProjectListApi(param: model){(result) in
            switch result{
            case.success(let json):
                print(json as AnyObject)
                
                let responseArr = responseArray.init(data: JSON(rawValue: json!) ?? "JSON")
                print(responseArr)
                if responseArr.status == 1
                {
                    if responseArr.result.count > 0
                    {
                        let projObj = ProjectListModel.init(data: responseArr.result[0])
                        let ProjectListDict : [String:Any] = [ "actualStartDate" : projObj.actualStartDate,
                                                    "actualEndDate" : projObj.actualEndDate,
                                                    "baselineEndDate" : projObj.baselineEndDate,
                                                    "baselineStartDate" : projObj.baselineStartDate,
                                                    "bimserverPoid" : projObj.bimserverPoid ,
                                                    "description" : projObj.description ,
                                                    "endDate" : projObj.endDate ,
                                                    "guid" : projObj.guid ,
                                                    "isEnabled" : projObj.isEnabled ,
                                                    "isWorkflowEnforced" : projObj.isWorkflowEnforced ,
                                                    "name" : projObj.name ,
                                                    "organisationGuidOfActor" : projObj.organisationGuidOfActor ,
//                                                               "statistics" : projObj.statistics
                        ]
                     
                        UserDefaults.standard.set(ProjectListDict, forKey:"ProjectListDict")
                    }
                        
                    
                    DispatchQueue.main.async {
                        self.delegate?.didReceiveProjectResponse(response:ProjectResponse(status: 1, message: ""))
                    }
                }
            case.failure(let err):
                print(err.localizedDescription)
                self.delegate?.didReceiveProjectResponse(response:ProjectResponse(status: 0, message: "error"))
                
                
            }
            
        }
    }
}
