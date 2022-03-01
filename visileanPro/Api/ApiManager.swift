//
//  loginClass.swift
//  visileanPro
//
//  Created by Visilean Meet on 04/02/22.
//

import Foundation
import Alamofire


enum APIerror : Error{
    case custom(message :String)
}
typealias Handler = (Swift.Result<Any?,APIerror>) -> Void
//typealias CompletionBlock = (_ data:JSON?,_ error:NSError?) -> Void
var loginviewVm = LoginViewVM()
var projectlistVm = ProjectListVM()
class APImanager{
    static let sharedInstance = APImanager()
   
    func callLoginAPI(param :LoginRequest,completionHandler :@escaping Handler ){
        var usernameforurl = UserDefaults.standard.string(forKey:"email") as? String ?? ""
        var passwordforurl =  UserDefaults.standard.string(forKey:"password") as? String ??  ""
        let Loginurl = "https://tgo.visilean.com/VisileanAPI/authenticate?password=\(passwordforurl)&username=\(usernameforurl)"
        let headers : HTTPHeaders = [ .contentType("application/json")]
        AF.request(Loginurl, method: .post, parameters: param, encoder: JSONParameterEncoder.default, headers: headers).response{
            response in debugPrint(response)
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                
                    if(response.response?.statusCode == 200)
                    {
                        let val = 200
                        LoginStatusCodeResponse.statusCode = val
                        completionHandler(.success(json))
                        let xauth = response.response?.value(forHTTPHeaderField: "x-auth-token") as! String
                        UserDefaults.standard.set(xauth,forKey: "TOKEN")
                        print(UserDefaultData.sharedInstance.tokenGLB)
                        UserDefaults.standard.set(param.password, forKey: "password")
                        UserDefaults.standard.set(param.email,forKey: "email")
                      
                    }
                    else{
                        
                        completionHandler(.failure(.custom(message: "Please check Network Conn")))
                       
                    }
                }catch let error{
                    print(error.localizedDescription)
                    completionHandler(.failure(.custom(message: "please try again")))
                }
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(.failure(.custom(message: "please try again")))
            }
        }.resume()
    }
    
    func headers() -> HTTPHeaders {
        let token = UserDefaults.standard.string(forKey: "TOKEN") ?? "TOKEN NOT FOUND"
        print(token)
        let headers: HTTPHeaders = [
            "x-auth-token": token,
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Access-Control-Allow-Headers" : "visilean-project-context"
        ]
        return headers
    }
    
    
    func callProjectListApi(param :projectListRequestModel,completionHandler :@escaping Handler ){
        //https://tgo.visilean.com/VisileanAPI/api/actor/actorguid/projectsWithStatistics
        
        let ProjectListURL = "https://tgo.visilean.com/VisileanAPI/api/actor/\(param.actorGUID)/projectsWithStatistics"
        
        AF.request(ProjectListURL, method: .get, parameters: Parameters.init(),  headers: headers()).response{
            
            response in debugPrint(response)
            switch response.result{
            case .success(let data):
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    self.checkAuthenticationToken(statusCode: response.response!.statusCode as Int)
                    if(response.response?.statusCode == 200)
                    {
                        completionHandler(.success(json))
                        print(json)
                    }
                    else{
                        completionHandler(.failure(.custom(message: "Please check Network Conn")))
                    }
                    
                }catch let error{
                    print(error.localizedDescription)
                    completionHandler(.failure(.custom(message: "please try again")))
                }
                
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(.failure(.custom(message: "please try again")))
            }
        }.resume()
    }
}

extension APImanager{
    func checkAuthenticationToken(statusCode : Int)
    {
        if(statusCode == 401)
        {
            loginviewVm.loginUser(loginRequest:(LoginRequest(email: UserDefaultData.sharedInstance.emailGLB, password: UserDefaultData.sharedInstance.passwordGLB)))
            
            projectlistVm.callProjectListing()
            
        }
    }
    
    
}
