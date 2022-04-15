//
//  File.swift
//  visileanPro
//
//  Created by Visilean Meet on 15/03/22.
//

import Foundation
import CoreData

protocol DPRrepo{
    func createDPR(DPRmodel: TaskListResult,currentdate : Int,latestartreason : String)
    func getall() -> [DPRmodel]?
    func getDprData(byIdentifier status: Int,startdate : Int,enddate : Int) -> [DPR]?
    func get(byIdentifier status: Int,startdate : Int,enddate : Int) -> Int
    
}

struct DPRdataRepo : DPRrepo{
    
    //-----add data into Core Data-----
    func createDPR(DPRmodel: TaskListResult,currentdate : Int,latestartreason :String) {
        
        let cdDPR = DPR(context: PersistentStoragedpr.shared.context)
        
        cdDPR.acurrentdate = Int64(currentdate)
        cdDPR.latestartreason = latestartreason
        cdDPR.externalID = DPRmodel.externalID
        cdDPR.guid = DPRmodel.guid
        cdDPR.showExternalID = DPRmodel.showExternalID
        cdDPR.importID =  DPRmodel.importID
        cdDPR.name = DPRmodel.name
        cdDPR.resultDescription = DPRmodel.resultDescription
        cdDPR.activitySafety = DPRmodel.activitySafety
        cdDPR.createdAt = Int64(DPRmodel.createdAt)
        cdDPR.updatedAt = Int64(DPRmodel.updatedAt)
        cdDPR.startDate = Int64(DPRmodel.startDate)
        cdDPR.endDate = Int64(DPRmodel.endDate)
        cdDPR.actualStartDate = Int64(DPRmodel.actualStartDate)
        cdDPR.actualEndDate = Int64(DPRmodel.actualEndDate)
        cdDPR.baselineStartDate = DPRmodel.baselineStartDate
        cdDPR.baselineEndDate = DPRmodel.baselineEndDate
        cdDPR.restartDate = Int64(DPRmodel.restartDate)
        cdDPR.warningDate = Int64(DPRmodel.warningDate)
        cdDPR.activityPriority = Int16(DPRmodel.activityPriority)
        cdDPR.locationGUID = DPRmodel.locationGUID
        cdDPR.activityLocation = DPRmodel.activityLocation
        cdDPR.hasChildren = DPRmodel.hasChildren
        cdDPR.trackingQuantityEstimate = Int64(DPRmodel.trackingQuantityEstimate)
        cdDPR.trackingQuantityCurrent = Int64(DPRmodel.trackingQuantityCurrent)
        cdDPR.trackingUnit = Int32(DPRmodel.trackingQuantityCurrent)
        cdDPR.completedPercentage = Int64(DPRmodel.completedPercentage)
        cdDPR.makeReadyDate = Int64(DPRmodel.makeReadyDate)
        cdDPR.parentGUID = DPRmodel.parentGUID
        cdDPR.projectGuid = DPRmodel.projectGuid
        cdDPR.status = Int64(DPRmodel.status)
        cdDPR.constrainingResourceRelations = DPRmodel.constrainingResourceRelations
        cdDPR.constrainedActivity = DPRmodel.constrainedActivity
        cdDPR.owner = DPRmodel.owner
        cdDPR.activityType = DPRmodel.activityType
        cdDPR.orgName = DPRmodel.orgName
        cdDPR.parentName = DPRmodel.parentName
        cdDPR.activityTrade = DPRmodel.activityTrade
        cdDPR.stoppedDate = Int64(DPRmodel.stoppedDate)
        cdDPR.rejectedDate = Int64(DPRmodel.rejectedDate)
        cdDPR.approvedBy = Int64(DPRmodel.approvedBy)
        cdDPR.rejectedBy = Int16(DPRmodel.rejectedBy)
        cdDPR.allCustomfields = DPRmodel.allCustomfields
        
        
        PersistentStoragedpr.shared.saveContext()
    }
    
    
    func getall() -> [DPRmodel]? {
        let result =  PersistentStoragedpr.shared.fetchManagedObject(managedObject: DPR.self)
        var TaskList : [DPRmodel] = []
        result?.forEach({(DPR) in
            TaskList.append(DPR.convertToDPR())
        })
        return TaskList
        
    }
    
    func updateStatusCode(DPRmodel: DPRmodel) -> Bool {
        
        let cdtaskdetail = getTaskDetails(byIdentifier: DPRmodel.guid)
        guard cdtaskdetail != nil else {return false}
        
        cdtaskdetail?.status = Int64(DPRmodel.status)
        
        PersistentStoragedpr.shared.saveContext()
        return true
    }
    
    func getDprData(byIdentifier status: Int,startdate : Int,enddate : Int) -> [DPR]?
    {
        let fetchRequest = NSFetchRequest<DPR>(entityName: "DPR")
        
        let predicate = NSPredicate(format: "((acurrentdate >= %lld) AND (acurrentdate < %lld)) AND status==%i",Int64(startdate),Int64(enddate),status)
        
        
        fetchRequest.predicate = predicate
        do {
            let result = try PersistentStoragedpr.shared.context.fetch(fetchRequest)
            
            guard result != nil else {return nil}
            
            return result
            
        } catch let error {
            debugPrint(error)
        }
        
        return nil
    }
    func get(byIdentifier status: Int,startdate : Int,enddate : Int) -> Int {
        
        let result = getDprData(byIdentifier: status,startdate : startdate,enddate : enddate)
        guard result != nil else {return 0}
        
        return result!.count
        
    }
    
}
