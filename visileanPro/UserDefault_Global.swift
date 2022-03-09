//
//  global.swift
//  visileanPro
//
//  Created by Visilean Meet on 07/02/22.
//  GLB = Global

import Foundation
import UIKit


struct UserDefaultData{
    static let sharedInstance = UserDefaultData()

    var usernameGLB : String = UserDefaults.standard.object(forKey:  "username") as? String ?? ""
    var emailGLB = UserDefaults.standard.object(forKey:"email") as? String ?? ""
    var passwordGLB = UserDefaults.standard.object(forKey:"password") as? String ?? ""
    var loginGLB = UserDefaults.standard.object(forKey:"Login") as? Bool ?? false
    var tokenGLB = UserDefaults.standard.object(forKey:"TOKEN") as? String ?? ""



}
func getProjectParameter() -> ProjectListModel
{
    if let projectParameter = UserDefaults.standard.object(forKey: "ProjectListDict") as? [String:Any]
    {
        return ProjectListModel.init(data: projectParameter)
    }
    else
    {
        return ProjectListModel()
    }
}

