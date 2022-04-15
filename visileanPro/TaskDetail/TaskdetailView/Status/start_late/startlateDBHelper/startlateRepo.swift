//
//  startlateRepo.swift
//  visileanPro
//
//  Created by Visilean Meet on 16/03/22.
//


import CoreData

protocol latestartRepo{
    func createlatestartReason(latestartlistModel: latestartlistModel)
    func getall() -> [latestartlistModel]?
    func getreson(byIdentifier guid: String) -> LatestartreasonCD?
    func get(byIdentifier guid: String) -> latestartlistModel?
    
}

struct latestartDataRepo : latestartRepo{
    
    //-----add data into Core Data-----
    func createlatestartReason(latestartlistModel: latestartlistModel)
    {
        
        let cdadd = LatestartreasonCD(context: PersistentStorageLateStartReason.shared.context)
        
        
        cdadd.id = latestartlistModel.id
        cdadd.guid = latestartlistModel.guid
        cdadd.customReasonName = latestartlistModel.customReasonName
        cdadd.ordinal = Int32(latestartlistModel.ordinal)
        
        
        PersistentStorageLateStartReason.shared.saveContext()
    }
    
    
    func getreson(byIdentifier guid: String) -> LatestartreasonCD?
    {
        let fetchRequest = NSFetchRequest<LatestartreasonCD>(entityName: "LatestartreasonCD")
        let predicate = NSPredicate(format: "guid==%@", guid as CVarArg)
        
        fetchRequest.predicate = predicate
        do {
            let result = try PersistentStorageLateStartReason.shared.context.fetch(fetchRequest).first
            
            guard result != nil else {return nil}
            return result
            
        } catch let error {
            debugPrint(error)
        }
        
        return nil
    }
    
    
    func get(byIdentifier guid: String) -> latestartlistModel? {
        
        let result = getreson(byIdentifier: guid)
        guard result != nil else {return nil}
        return result?.convertToReason()
        
    }
    
    func getall() -> [latestartlistModel]? {
        let result =  PersistentStorageLateStartReason.shared.fetchManagedObject(managedObject: LatestartreasonCD.self)
        var TaskList : [latestartlistModel] = []
        result?.forEach({(tasklistcd) in
            TaskList.append(tasklistcd.convertToReason())
        })
        return TaskList
        
    }
    
}
