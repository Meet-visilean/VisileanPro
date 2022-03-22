//
//  TaskListRepo.swift
//  visileanPro
//
//  Created by Visilean Meet on 02/03/22.
//

import Foundation
import CoreData

protocol TaskListRepo{
    func createTaskList(TaskListresult: TaskListResult)
    func getall() -> [TaskListResult]?
    func getTaskDetails(byIdentifier guid: String) -> TaskListCD?
    
    
}

struct TaskListDataRepo : TaskListRepo{

    //-----add data into Core Data-----
    func createTaskList(TaskListresult: TaskListResult) {
        
        let cdTaskList = TaskListCD(context: PersistentStorage.shared.context)
        
        cdTaskList.externalID = TaskListresult.externalID
        cdTaskList.guid = TaskListresult.guid
        cdTaskList.showExternalID = TaskListresult.showExternalID
        cdTaskList.importID =  TaskListresult.importID
        cdTaskList.name = TaskListresult.name
        cdTaskList.resultDescription = TaskListresult.resultDescription
        cdTaskList.activitySafety = TaskListresult.activitySafety
        cdTaskList.createdAt = Int64(TaskListresult.createdAt)
        cdTaskList.updatedAt = Int64(TaskListresult.updatedAt)
        cdTaskList.startDate = Int64(TaskListresult.startDate)
        cdTaskList.endDate = Int64(TaskListresult.endDate)
        cdTaskList.actualStartDate = Int64(TaskListresult.actualStartDate)
        cdTaskList.actualEndDate = Int64(TaskListresult.actualEndDate)
        cdTaskList.baselineStartDate = TaskListresult.baselineStartDate
        cdTaskList.baselineEndDate = TaskListresult.baselineEndDate
        cdTaskList.restartDate = Int64(TaskListresult.restartDate)
        cdTaskList.warningDate = Int64(TaskListresult.warningDate)
        cdTaskList.activityPriority = Int16(TaskListresult.activityPriority)
        cdTaskList.locationGUID = TaskListresult.locationGUID
        cdTaskList.activityLocation = TaskListresult.activityLocation
        cdTaskList.hasChildren = TaskListresult.hasChildren
        cdTaskList.trackingQuantityEstimate = Int64(TaskListresult.trackingQuantityEstimate)
        cdTaskList.trackingQuantityCurrent = Int64(TaskListresult.trackingQuantityCurrent)
        cdTaskList.trackingUnit = Int32(TaskListresult.trackingQuantityCurrent)
        cdTaskList.completedPercentage = Int64(TaskListresult.completedPercentage)
        cdTaskList.makeReadyDate = Int64(TaskListresult.makeReadyDate)
        cdTaskList.parentGUID = TaskListresult.parentGUID
        cdTaskList.projectGuid = TaskListresult.projectGuid
        cdTaskList.status = Int64(TaskListresult.status)
        cdTaskList.constrainingResourceRelations = TaskListresult.constrainingResourceRelations
        cdTaskList.constrainedActivity = TaskListresult.constrainedActivity
        cdTaskList.owner = TaskListresult.owner
        cdTaskList.activityType = TaskListresult.activityType
        cdTaskList.orgName = TaskListresult.orgName
        cdTaskList.parentName = TaskListresult.parentName
        cdTaskList.activityTrade = TaskListresult.activityTrade
        cdTaskList.stoppedDate = Int64(TaskListresult.stoppedDate)
        cdTaskList.rejectedDate = Int64(TaskListresult.rejectedDate)
        cdTaskList.approvedBy = Int64(TaskListresult.approvedBy)
        cdTaskList.rejectedBy = Int16(TaskListresult.rejectedBy)
        cdTaskList.allCustomfields = TaskListresult.allCustomfields
        PersistentStorage.shared.saveContext()
    }
    
    
    func getall() -> [TaskListResult]? {
        let result =  PersistentStorage.shared.fetchManagedObject(managedObject: TaskListCD.self)
        var TaskList : [TaskListResult] = []
        result?.forEach({(tasklistcd) in
            TaskList.append(tasklistcd.convertToTask())
        })
        return TaskList

    }

    func updateStatusCode(taskListResult: TaskListResult) -> Bool {

        let cdtaskdetail = getTaskDetails(byIdentifier: taskListResult.guid)
        guard cdtaskdetail != nil else {return false}
        
        cdtaskdetail?.status = Int64(taskListResult.status)
       
        PersistentStorage.shared.saveContext()
        return true
    }

    func getTaskDetails(byIdentifier guid: String) -> TaskListCD?
   {
       let fetchRequest = NSFetchRequest<TaskListCD>(entityName: "TaskListCD")
       let predicate = NSPredicate(format: "guid==%@", guid as CVarArg)

       fetchRequest.predicate = predicate
       do {
           let result = try PersistentStorage.shared.context.fetch(fetchRequest).first

           guard result != nil else {return nil}
           return result

       } catch let error {
           debugPrint(error)
       }

       return nil
   }
   func get(byIdentifier guid: String) -> TaskListResult? {

       let result = getTaskDetails(byIdentifier: guid)
       guard result != nil else {return nil}
       return result?.convertToTask()
       
   }
    
    
}
