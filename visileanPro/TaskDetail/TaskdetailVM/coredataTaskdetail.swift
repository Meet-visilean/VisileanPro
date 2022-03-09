//
//  CoreDataFetchData.swift
//  visileanPro
//
//  Created by Visilean Meet on 07/03/22.
//

import Foundation
import CoreData


 func getTaskDetails(byIdentifier projectGuid: String) -> TaskListCD?
{
    let fetchRequest = NSFetchRequest<TaskListCD>(entityName: "TaskListCD")
    let predicate = NSPredicate(format: "projectGuid==%@", projectGuid as CVarArg)

    fetchRequest.predicate = predicate
    do {
        let result = try PersistentStorage.shared.context.fetch(fetchRequest).first

        guard result != nil else {return nil}
        print(result?.activityType)
        return result

    } catch let error {
        debugPrint(error)
    }

    return nil
}
func get(byIdentifier projectGuid: String) -> TaskListResult? {

    let result = getTaskDetails(byIdentifier: projectGuid)
    guard result != nil else {return nil}
    return result?.convertToTask()
    
}
