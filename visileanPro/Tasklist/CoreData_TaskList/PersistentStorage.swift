//
//  PersistentStorage.swift
//  visileanPro
//
//  Created by Visilean Meet on 02/03/22.
//

import Foundation
import CoreData
import UIKit
final class PersistentStorage{
    
    private init(){}
    static let shared = PersistentStorage()
    lazy var persistentContainer : NSPersistentContainer = {
     
        let container = NSPersistentContainer(name: "TaskListCD")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    lazy var context = persistentContainer.viewContext
 
    func saveContext () {
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchManagedObject<T: NSManagedObject>(managedObject : T.Type) -> [T]?
    {
        do{
            guard let result = try
                    PersistentStorage.shared.context.fetch(managedObject.fetchRequest()) as? [T] else {return nil}
            return result
        }
        catch let error{
            debugPrint(error)

        }
        return nil
    }
}

//MARK: - DPR
final class PersistentStoragedpr{
    
    private init(){}
    static let shared = PersistentStoragedpr()
    lazy var persistentContainer : NSPersistentContainer = {
  
        let container = NSPersistentContainer(name: "DPR")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    lazy var context = persistentContainer.viewContext
 
    func saveContext () {
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchManagedObject<T: NSManagedObject>(managedObject : T.Type) -> [T]?
    {
        do{
            guard let result = try
                    PersistentStoragedpr.shared.context.fetch(managedObject.fetchRequest()) as? [T] else {return nil}
            return result
        }
        catch let error{
            debugPrint(error)

        }
        return nil
    }
}

//MARK: - LATE START REASONS
final class PersistentStorageLateStartReason{
    
    private init(){}
    static let shared = PersistentStorageLateStartReason()
    lazy var persistentContainer : NSPersistentContainer = {
        // MARK: - Core Data stack
        
        let container = NSPersistentContainer(name: "LatestartreasonCD")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    lazy var context = persistentContainer.viewContext
    // MARK: - Core Data Saving support
    
    func saveContext () {
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchManagedObject<T: NSManagedObject>(managedObject : T.Type) -> [T]?
    {
        do{
            guard let result = try
                    PersistentStorageLateStartReason.shared.context.fetch(managedObject.fetchRequest()) as? [T] else {return nil}
            return result
        }
        catch let error{
            debugPrint(error)

        }
        return nil
    }
}


//MARK: - LEADERBOARD - ALLDATA
final class PersistentStorageLeaderBoard{
    
    private init(){}
    static let shared = PersistentStorageLeaderBoard()
    lazy var persistentContainer : NSPersistentContainer = {
        // MARK: - Core Data stack
        
        let container = NSPersistentContainer(name: "AllDataCD")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    
    lazy var context = persistentContainer.viewContext
    // MARK: - Core Data Saving support
    
    func saveContext () {
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchManagedObject<T: NSManagedObject>(managedObject : T.Type) -> [T]?
    {
        do{
            guard let result = try
                    PersistentStorageLeaderBoard.shared.context.fetch(managedObject.fetchRequest()) as? [T] else {return nil}
            return result
        }
        catch let error{
            debugPrint(error)

        }
        return nil
    }
}

