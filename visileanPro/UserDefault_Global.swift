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
    var usernameGLB : String = UserDefaults.standard.string(forKey: "username") ?? "username"
    var emailGLB = UserDefaults.standard.string(forKey:"email") ?? ""
    var passwordGLB = UserDefaults.standard.string(forKey:"password") ?? ""
    var loginGLB = UserDefaults.standard.bool(forKey:"Login")
    var tokenGLB = UserDefaults.standard.object(forKey:"TOKEN")

   
//    init()
//   init(email:String,password:String)
//        {
//            emailGLB = email.self
//            passwordGLB = password.self
//
//        }
}
