//
//  LoginViewVM.swift
//  visileanPro
//
//  Created by Visilean on 25/02/22.
//

import UIKit
import Alamofire
//LoginResponse

protocol LoginViewModelDelegate {
    func didReceiveLoginResponse(loginResponse: LoginResponse?)
}
struct LoginViewVM  {

    var delegate : LoginViewModelDelegate?
    
    func loginUser(loginRequest: LoginRequest)
    {
        let validationResult = LoginValidation().checkValidation(loginrequest: loginRequest)
        if(validationResult.result == true)
        {
            APImanager.sharedInstance.callLoginAPI(param: loginRequest) {(result) in
                switch result{
                case.success(let json):
                    let usernameFromResponse = (json as AnyObject).value(forKey: "username")as! String
                    let userGUIDFromResponse = (json as AnyObject).value(forKey: "userId")as! String
                    UserDefaults.standard.set(usernameFromResponse,forKey: "usernameUserDefault")
                    UserDefaults.standard.set(userGUIDFromResponse,forKey: "userGUIDUserDefault")
                    print(usernameFromResponse)
                    print(userGUIDFromResponse)
                    DispatchQueue.main.async {
                        self.delegate?.didReceiveLoginResponse(loginResponse: LoginResponse(errorMessage: nil,data: .init(username: usernameFromResponse, password: "")))
                    }
                case.failure(let err):
                    print(err.localizedDescription)
                   
                }
            }
        }
        else{
            self.delegate?.didReceiveLoginResponse(loginResponse: LoginResponse(errorMessage: validationResult.message, data: nil))
            
        }
        
    }
    
}
