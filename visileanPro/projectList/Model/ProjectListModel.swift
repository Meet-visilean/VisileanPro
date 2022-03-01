//
//  ProjectListModel.swift
//  visileanPro
//
//  Created by Visilean on 25/02/22.
//

import Foundation
import SwiftyJSON

struct ProjectListModel{
    var actualEndDate = 0;
    var actualStartDate = 0;
    var  baselineEndDate = 0
    var  baselineStartDate = 0;
    var bimserverPoid = "";
    var description = "";
    var endDate = 0;
    var guid = "";
    var isEnabled = 0;
    var isWorkflowEnforced = 0;
    var name = "";
    var organisationGuidOfActor = "";
//    var statistics = Statistics.self
//    
    init(data : JSON)
    {
        self.actualEndDate = data["actualEndDate"].int ?? 0
        self.actualStartDate = data["actualStartDate"].int ?? 0
        self.baselineEndDate = data["baselineEndDate"].int ?? 0
        self.baselineStartDate = data["baselineStartDate"].int ?? 0
        self.bimserverPoid = data["bimserverPoid"].string ?? ""
        self.description = data["actualStartDate"].string ?? ""
        self.endDate = data["endDate"].int ?? 0
        self.guid = data["guid"].string ?? ""
        self.isEnabled = data["isEnabled"].int ?? 0
        self.isWorkflowEnforced = data["isWorkflowEnforced"].int ?? 0
        self.name = data["name"].string ?? ""
        self.organisationGuidOfActor = data["organisationGuidOfActor"].string ?? ""
       // self.statistics = data["statistics"]
    }
}
//struct Statistics {
//   // let projGUID, completedPercentage, stoppedTasks, warningTasks: String
//    let weeklyPercentagePlanCompleted: String
//
//    init(data : JSON)
//    {
//        self.weeklyPercentagePlanCompleted = data["weeklyPercentagePlanCompleted"].string ?? ""
//    }
//}



struct responseArray{
    var status = 0
    var message = ""
    var result : [JSON] = []
    
    init(data : JSON)
    {
        self.status = data["status"].int ?? 0
        self.message = data["message"].string ?? ""
        self.result = data["result"].array ?? []
    }
}
struct ProjectResponse
{
    var status = 0
    var message = ""
}
