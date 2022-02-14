//
//  LoginCall.swift
//  visileanPro
//
//  Created by Visilean Meet on 04/02/22.
//

import Foundation
import UIKit

struct LoginModel:Encodable{
    let username :String
    let password : String
}
var usernamee : String = ""
var passwordd : String = ""

var status : Bool = false


// MARK: - LoginJsonData
struct LoginJSONData:Codable {
    let userID: String
    let username: String
    let accountNonExpired: Bool
    let accountNonLocked: Bool
    let credentialsNonExpired: Bool
    let enabled: Bool
    let twoFactorEnable: Bool
}

