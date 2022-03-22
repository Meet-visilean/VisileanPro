//
//  StatusLateReasonVM.swift
//  visileanPro
//
//  Created by Visilean Meet on 16/03/22.
//

import Foundation
import SwiftyJSON
import UIKit


struct latestartReasonVM{
    private let manager: latestartmanager = latestartmanager()
    func calllatestartAPI()
    {
        let projctdata = UserDefaults.standard.dictionary(forKey: "ProjectListDict")
        //nil because project API not called
        let projectGUID = projctdata!["guid"] as! String
      
      
        APImanager.sharedInstance.LastestartAPIcall(param: projectGUID ){(result) in
            switch result{
            case.success(let json):
            
                let resultArr = lateStartResponseModel.init(data: JSON(rawValue: json!) ?? "JSON")
                if resultArr.status == 1
                {
                    var i = 0
                    var temp = (resultArr.result.count)
                    while(temp != 0)
                    {
                        let lateresonOBJ = latestartlistModel.init(data: resultArr.result[i])
                       let cddata =  manager.fetchTask()
                        if cddata?.count != 0
                        {
                            let resonsdata = manager.get(byIdentifier: lateresonOBJ.guid)
                            if resonsdata?.guid == nil
                            {
                                print("specific  data add to coredata")
                               manager.createlatestartReason(latestartlistModel: lateresonOBJ)
                            }
                        }
                        else
                        {
                            print("First Time add data to coredata")
                            manager.createlatestartReason(latestartlistModel: lateresonOBJ)
                        }
                        temp = temp - 1
                        i = i + 1
                    }
                }
            
                
            case.failure(let err):
                print(err.localizedDescription)
              
                
                
            }
            
        }
    }
}
