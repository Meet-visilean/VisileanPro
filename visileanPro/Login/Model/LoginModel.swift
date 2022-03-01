//
//  LoginCall.swift
//  visileanPro
//
//  Created by Visilean Meet on 04/02/22.
//

import Foundation
import UIKit

struct LoginResponse:Encodable{
    let errorMessage: String?
    let data: LoginResponseData?
}

struct LoginResponseData:Encodable{
    let username :String
    let password : String
}

struct LoginStatusCodeResponse{
    static var statusCode : Int = 0
}

var usernamee : String = ""
var passwordd : String = ""


