//
//  Validation.swift
//  visileanPro
//
//  Created by Visilean Meet on 24/02/22.
//

import Foundation


struct LoginValidation{
    
    func checkValidation(loginrequest : LoginRequest) -> ValidationResult
    {
        
        if loginrequest.email?.count == 0
        {
            return ValidationResult.init(result: false, message: "Please enter email")
        }
        else if loginrequest.email?.invalidEmail() == true
        {
            return ValidationResult.init(result: false, message: "Please enter valid email")
        }
        else if loginrequest.password?.count == 0
        {
            return ValidationResult.init(result: false, message: "Please enter password")
        }
        
        else
        {
            return ValidationResult.init(result: true, message: "valid id and pass")
            
        }
    }
    func CheckStatusCode() -> ValidationResult{
        if(LoginStatusCodeResponse.statusCode == 200)
    {
        return ValidationResult.init(result: true, message: "Login Success")
    }
    else
    {
        return ValidationResult.init(result: false, message: "Status code erro")
    }
        
    }

}
