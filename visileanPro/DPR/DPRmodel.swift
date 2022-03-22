//
//  DPRmodel.swift
//  visileanPro
//
//  Created by Visilean Meet on 15/03/22.
//

import Foundation

struct DPRmodel {
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
    let acurrentdate : Int64
    let latestartreason : [String]

   
    
    
    init(name : String ,startdate : Int64,enddate : Int64,activitytype : String,status : Int,guid : String,externalID : String,showExternalID:String,importID:String,resultDescription:String,activitySafety : String,createdAt:Int,updatedAt:Int,actualStartDate:Int,actualEndDate:Int64,baselineStartDate:Int,baselineEndDate:Int64,restartDate:Int,warningDate:Int,activityPriority:Int,locationGUID:String,activityLocation:String,hasChildren:Bool,trackingQuantityEstimate:Int,trackingQuantityCurrent:Int,trackingUnit:Int32,completedPercentage:Int,makeReadyDate:Int,parentGUID:String,projectGuid:String,constrainingResourceRelations:String,constrainedActivity:String,owner:String,orgName:String,parentName:String,activityTrade:String,stoppedDate:Int,rejectedDate:Int,approvedBy:Int,rejectedBy:Int,allCustomfields:String,acurrentdate : Int64,latestartreason : [String])
    {
      
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
        self.acurrentdate=acurrentdate
        self.latestartreason=latestartreason
    }
}
