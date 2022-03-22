//
//  lateStartModel.swift
//  visileanPro
//
//  Created by Visilean Meet on 16/03/22.
//

import Foundation
import SwiftyJSON


struct lateStartResponseModel {
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

    struct latestartlistModel {
        let id, guid, customReasonName: String
        let ordinal: Int
//
        init(id: String, guid: String, customReasonName: String, ordinal: Int) {
            self.id = id
            self.guid = guid
            self.customReasonName = customReasonName
            self.ordinal = ordinal
        }
        
        init(data : JSON) {
            self.id = data["@id"].string ?? ""
            self.guid = data["guid"].string ?? ""
            self.customReasonName = data["customReasonName"].string ?? ""
            self.ordinal = data["ordinal"].int ?? 0
        }
    }
