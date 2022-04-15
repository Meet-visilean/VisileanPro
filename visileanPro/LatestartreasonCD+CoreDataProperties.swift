//
//  LatestartreasonCD+CoreDataProperties.swift
//  
//
//  Created by Visilean Meet on 16/03/22.
//
//

import Foundation
import CoreData


extension LatestartreasonCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LatestartreasonCD> {
        return NSFetchRequest<LatestartreasonCD>(entityName: "LatestartreasonCD")
    }

    @NSManaged public var id: String?
    @NSManaged public var guid: String?
    @NSManaged public var customReasonName: String?
    @NSManaged public var ordinal: Int32

    
    func convertToReason()-> latestartlistModel
    {
        return latestartlistModel(id :self.id ?? "", guid: self.guid ?? "" , customReasonName:  self.customReasonName ?? "", ordinal: Int(self.ordinal )  )
        
    }
    }


