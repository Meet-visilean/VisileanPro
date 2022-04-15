//
//  CoredbClear.swift
//  visileanPro
//
//  Created by Visilean Meet on 04/04/22.
//

import Foundation
import CoreData

class clearDB{
    static let shared = clearDB()
    
    func clearCoreDBTaskList()
    {
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = TaskListCD.fetchRequest()
        let deleteReqest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
     
        do {
            try PersistentStorage.shared.context.execute(deleteReqest)
        } catch {
            print(error)
        }
        PersistentStorage.shared.saveContext()
        
        
    }
    func clearCoreDBDPR()
    {
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = DPR.fetchRequest()
    

        let deleteReqest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try PersistentStoragedpr.shared.context.execute(deleteReqest)
        } catch {
            print(error)
        }
        PersistentStoragedpr.shared.saveContext()
        
        
    }
    func clearCoreDBlatestartReasons()
    {
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = LatestartreasonCD.fetchRequest()
        let deleteReqest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
       
        do {
            try PersistentStorageLateStartReason.shared.context.execute(deleteReqest)
        } catch {
            print(error)
        }
        PersistentStorageLateStartReason.shared.saveContext()
        
        
    }
    
}
