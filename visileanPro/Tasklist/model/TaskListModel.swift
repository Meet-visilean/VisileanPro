//
//  TaskListModel.swift
//  visileanPro
//
//  Created by Visilean Meet on 02/03/22.
//

import Foundation
import SwiftyJSON

struct TaskListResponseModel {
    var status: Int
    var message: String
    var result : [JSON] = []
    init(data : JSON)
    {
        self.status = data["status"].int ?? 0
        self.message = data["message"].string ?? ""
        self.result = data["result"].array ?? []
    }
}

// MARK: - Result
struct TaskListResult {
    let guid: String
    let externalID: String
    let showExternalID: String
    let importID : String
    let name : String
    let resultDescription : String
    let activitySafety: String
    let createdAt: Int
    let updatedAt: Int
    let startDate : Int64
    var endDate : Int64
    let actualStartDate :Int
    let actualEndDate: Int
    let baselineStartDate : Int64
    let baselineEndDate : Int64
    let restartDate: Int
    let warningDate: Int
    let activityPriority: Int
    let locationGUID: String
    let activityLocation: String
    let hasChildren: Bool
    let trackingQuantityEstimate: Int
    let trackingQuantityCurrent: Int
    let trackingUnit: Int32
    let completedPercentage: Int
    let makeReadyDate: Int
    let parentGUID: String
    let projectGuid: String
    var status: Int
    let constrainingResourceRelations: String
    let constrainedActivity: String
    let owner: String
    let activityType: String
    let orgName: String
    let parentName: String
    let activityTrade: String
    let stoppedDate: Int
    let  rejectedDate: Int
    let  approvedBy: Int
    let  rejectedBy: Int
    let allCustomfields: String

   // let responsibleActor: ResponsibleActor
    var responsibleactor : [String:JSON] = [:]
    // let children, constrainingActivityRelations: [Any?]
    //let prerequisites: [Any?]
    // let notes, customFields, customFieldIDValue: [Any?]
    
    
    init(name : String ,startdate : Int64,enddate : Int64,activitytype : String,status : Int,guid : String,externalID : String,showExternalID:String,importID:String,resultDescription:String,activitySafety : String,createdAt:Int,updatedAt:Int,actualStartDate:Int,actualEndDate:Int64,baselineStartDate:Int,baselineEndDate:Int64,restartDate:Int,warningDate:Int,activityPriority:Int,locationGUID:String,activityLocation:String,hasChildren:Bool,trackingQuantityEstimate:Int,trackingQuantityCurrent:Int,trackingUnit:Int32,completedPercentage:Int,makeReadyDate:Int,parentGUID:String,projectGuid:String,constrainingResourceRelations:String,constrainedActivity:String,owner:String,orgName:String,parentName:String,activityTrade:String,stoppedDate:Int,rejectedDate:Int,approvedBy:Int,rejectedBy:Int,allCustomfields:String)
    {
      //  self.guid = guid
        self.name = name
        self.endDate = enddate
        self.startDate = startdate
        self.activityType = activitytype
        self.status = status
        self.guid  = guid
        self.externalID = externalID
        self.showExternalID = showExternalID
        self.importID = importID
        self.resultDescription = resultDescription
        self.activitySafety = activitySafety
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.actualStartDate = actualStartDate
        self.actualEndDate=Int(actualEndDate)
        self.baselineStartDate=Int64(baselineStartDate)
        self.baselineEndDate=baselineEndDate
        self.restartDate=restartDate
        self.warningDate=warningDate
        self.activityPriority=activityPriority
        self.locationGUID=locationGUID
        self.activityLocation=activityLocation
        self.hasChildren=hasChildren
        self.trackingQuantityEstimate=trackingQuantityEstimate
        self.trackingQuantityCurrent=trackingQuantityCurrent
        self.trackingUnit=trackingUnit
        self.completedPercentage=completedPercentage
        self.makeReadyDate=makeReadyDate
        self.parentGUID=parentGUID
        self.projectGuid=projectGuid
        self.constrainingResourceRelations=constrainingResourceRelations
        self.constrainedActivity=constrainedActivity
        self.owner=owner
        self.orgName=orgName
        self.parentName=parentName
        self.activityTrade=activityTrade
        self.stoppedDate=stoppedDate
        self.rejectedDate=rejectedDate
        self.approvedBy=approvedBy
        self.rejectedBy=rejectedBy
        self.allCustomfields=allCustomfields
    }

    
    init(data : JSON)
    {
        self.guid = data["guid"].string ?? "null"
        self.externalID = data["externalID"].string ?? "null"
        self.showExternalID = data["showExternalID"].string ?? "null"
        self.importID = data["importID"].string ?? "null"
        self.name = data["name"].string ?? "nullllll"
        self.resultDescription = data["description"].string ?? "null"
        self.activitySafety = data["activitySafety"].string ?? "null"
        self.createdAt = data["createdAt"].int ?? 0
        self.updatedAt = data["updatedAt"].int ?? 0
        self.startDate = data["startDate"].int64 ?? 0
        self.endDate = data["endDate"].int64 ?? 0
        self.actualStartDate = data["actualStartDate"].int ?? 0
        self.actualEndDate = data["actualEndDate"].int ?? 0
        self.baselineStartDate = data["baselineStartDate"].int64 ?? 0
        self.baselineEndDate = data["baselineEndDate"].int64 ?? 0
        self.restartDate = data["restartDate"].int ?? 0
        self.warningDate = data["warningDate"].int ?? 0
        self.activityPriority = data["activityPriority"].int ?? 0
        self.locationGUID = data["locationGUID"].string ?? ""
        self.activityLocation = data["activityLocation"].string ?? ""
        self.hasChildren = data["hasChildren"].bool ?? false
        self.trackingQuantityEstimate = data["trackingQuantityEstimate"].int ?? 0
        self.trackingQuantityCurrent = data["trackingQuantityCurrent"].int ?? 0
        self.trackingUnit = data["trackingUnit"].int32 ?? 0
        self.completedPercentage = data["completedPercentage"].int ?? 0
        self.makeReadyDate = data["makeRead"].int ?? 0
        self.parentGUID = data["parentGUID"].string ?? ""
        self.projectGuid = data["projectGuid"].string ?? "PRojectGuid"
        self.owner = data["owner"].string ?? ""
        self.constrainingResourceRelations = data["constrainingResourceRelations"].string ?? ""
        self.constrainedActivity = data["constrainedActivity"].string ?? ""
        self.status = data["status"].int ?? 0
        self.activityType = data["activityType"].string ?? ""
        self.orgName = data["orgName"].string ?? ""
        self.parentName = data["parentName"].string ?? ""
        self.activityTrade = data["activityTrade"].string ?? ""
        self.stoppedDate = data["stoppedDate"].int ?? 0
        self.rejectedDate = data["rejectedDate"].int ?? 0
        self.approvedBy = data["approvedBy"].int ?? 0
        self.rejectedBy = data["rejectedBy"].int ?? 0
        self.allCustomfields = data["allCustomfields"].string ?? ""
        //self.responsibleActor = data["responsibleActor"].dictionaryValue ?? []
        self.responsibleactor = data["responsibleActor"].dictionary ?? [:]
       // responsibleactor.count > 0
        ResponsibleActor(data: JSON(rawValue: responsibleactor) ?? "")
        
    }
    
}
// MARK: - ResponsibleActor
struct ResponsibleActor {
    let guid: String
    let name: String
    let orgGUID: String
    let orgName: String
    
    init(data : JSON)
    {
        self.guid = data["guid"].string ?? ""
        self.name = data["name"].string ?? ""
        self.orgGUID = data["orgGUID"].string ?? ""
        self.orgName = data["orgName"].string ?? ""
    }
    
}

