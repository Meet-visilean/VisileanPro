//
//  AllDataCD+CoreDataProperties.swift
//  
//
//  Created by Visilean Meet on 17/03/22.
//
//

import Foundation
import CoreData


extension AllDataCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AllDataCD> {
        return NSFetchRequest<AllDataCD>(entityName: "AllDataCD")
    }

    @NSManaged public var activityLocation: String?
    @NSManaged public var activityPriority: Int16
    @NSManaged public var activitySafety: String?
    @NSManaged public var activityTrade: String?
    @NSManaged public var activityType: String?
    @NSManaged public var actualEndDate: Int64
    @NSManaged public var actualStartDate: Int64
    @NSManaged public var allCustomfields: String?
    @NSManaged public var approvedBy: Int64
    @NSManaged public var baselineEndDate: Int64
    @NSManaged public var baselineStartDate: Int64
    @NSManaged public var completedPercentage: Int64
    @NSManaged public var constrainedActivity: String?
    @NSManaged public var constrainingResourceRelations: String?
    @NSManaged public var createdAt: Int64
    @NSManaged public var endDate: Int64
    @NSManaged public var externalID: String?
    @NSManaged public var guid: String?
    @NSManaged public var hasChildren: Bool
    @NSManaged public var importID: String?
    @NSManaged public var locationGUID: String?
    @NSManaged public var makeReadyDate: Int64
    @NSManaged public var name: String?
    @NSManaged public var orgName: String?
    @NSManaged public var owner: String?
    @NSManaged public var parentGUID: String?
    @NSManaged public var parentName: String?
    @NSManaged public var projectGuid: String?
    @NSManaged public var rejectedBy: Int16
    @NSManaged public var rejectedDate: Int64
    @NSManaged public var restartDate: Int64
    @NSManaged public var resultDescription: String?
    @NSManaged public var showExternalID: String?
    @NSManaged public var startDate: Int64
    @NSManaged public var status: Int64
    @NSManaged public var stoppedDate: Int64
    @NSManaged public var trackingQuantityCurrent: Int64
    @NSManaged public var trackingQuantityEstimate: Int64
    @NSManaged public var trackingUnit: Int32
    @NSManaged public var updatedAt: Int64
    @NSManaged public var warningDate: Int64
    @NSManaged public var actorguid: String?
    @NSManaged public var actorname: String?
    @NSManaged public var actororgguid: String?
    @NSManaged public var actororgname: String?

    
    func convertToTask()-> TaskListResultALL
    {
        return TaskListResultALL(name :self.name ?? "", startdate: Int64(self.startDate), enddate: Int64(self.endDate), activitytype:  self.activityType ?? "activotyCD", status: Int(self.status), guid: self.guid ?? "", externalID: self.externalID ?? "",showExternalID: self.showExternalID ?? "", importID: self.importID ?? "importid",resultDescription: self.resultDescription ?? "notnill", activitySafety: self.activitySafety ?? "", createdAt: Int(self.createdAt), updatedAt: Int(self.updatedAt), actualStartDate: Int(self.actualStartDate), actualEndDate: self.actualEndDate, baselineStartDate: Int(self.baselineStartDate), baselineEndDate:  Int64(self.baselineEndDate), restartDate: Int(self.restartDate) , warningDate: Int(self.warningDate), activityPriority: Int(self.activityPriority), locationGUID: self.locationGUID ?? "LocationGuid", activityLocation: self.activityLocation ?? "activityLoaction", hasChildren: self.hasChildren, trackingQuantityEstimate: Int(self.trackingQuantityEstimate), trackingQuantityCurrent: Int(self.trackingQuantityCurrent),trackingUnit:Int32(self.trackingUnit) , completedPercentage: Int(self.completedPercentage), makeReadyDate: Int(self.makeReadyDate), parentGUID: self.parentGUID ?? "", projectGuid: self.projectGuid ?? "projectGuid", constrainingResourceRelations: self.constrainingResourceRelations ?? "" , constrainedActivity: self.constrainedActivity ?? "consactivity", owner: self.owner ?? "owner" , orgName: self.orgName ?? "orgname", parentName: self.parentName ?? "parentname", activityTrade: self.activityTrade ?? "activitytrade", stoppedDate: Int(self.stoppedDate), rejectedDate: Int(self.rejectedDate), approvedBy: Int(self.approvedBy), rejectedBy: Int(self.rejectedBy), allCustomfields: self.allCustomfields ?? "xustomfield",actorguid: self.actorguid ?? "",actorname: self.actorname ?? "",actororgguid: self.actororgguid ?? "",actororgname: self.actororgname ?? "")
        
    }
}
