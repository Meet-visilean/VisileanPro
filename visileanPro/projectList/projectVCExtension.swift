//
//  projectVCExtension.swift
//  visileanPro
//
//  Created by Visilean Meet on 28/02/22.
//

import Foundation
import UIKit
//ProjectViewModelDelegate

extension dashBoard : ProjectViewModelDelegate
{
    
    func didReceiveProjectResponse(response: ProjectResponse?){
        
        if(response?.status == 1)
        {
            debugPrint("-------ProjectList-success----------")
           
            
        }
        else if (response?.message != nil && response?.status == 0)
        {
            let alert = UIAlertController(title: "Error", message: response?.message , preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
}
