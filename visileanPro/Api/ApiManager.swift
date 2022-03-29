//
//  loginClass.swift
//  visileanPro
//
//  Created by Visilean Meet on 04/02/22.
//

import Foundation
import Alamofire
import SwiftyJSON


enum APIerror : Error{
    case custom(message :String)
}
typealias Handler = (Swift.Result<Any?,APIerror>) -> Void
var loginviewVm = LoginViewVM()
var projectlistVm = ProjectListVM()
var tasklistVm = TaskListVM()
var leaderBoardVm = LeaderBoardVM()
class APImanager{
    static let sharedInstance = APImanager()
    
    //MARK: -Header For Request
    
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
    
    //MARK: -Login Api
    
    func callLoginAPI(param :LoginRequest,completionHandler :@escaping Handler ){
        let usernameforurl = UserDefaults.standard.string(forKey:"email") ?? ""
        let passwordforurl =  UserDefaults.standard.string(forKey:"password") ??  ""
        let Loginurl = "https://tgo.visilean.com/VisileanAPI/authenticate?password=\(passwordforurl)&username=\(usernameforurl)"
        
        let headers : HTTPHeaders = [ .contentType("application/json")]
        
      let task =  AF.request(Loginurl, method: .post, parameters: param, encoder: JSONParameterEncoder.default, headers: headers).response{
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
                        let xauth = response.response?.value(forHTTPHeaderField: "x-auth-token")
                        print(xauth)
                        UserDefaults.standard.set(xauth,forKey: "TOKEN")
                        
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
        }
            task.resume()
    }
    
    
    //MARK: - Project Listing Api
    func callProjectListApi(param :projectListRequestModel,completionHandler :@escaping Handler ){
        //https://tgo.visilean.com/VisileanAPI/api/actor/actorguid/projectsWithStatistics
        
        let ProjectListURL = "https://tgo.visilean.com/VisileanAPI/api/actor/\(param.actorGUID)/projectsWithStatistics"
        
        AF.request(ProjectListURL, method: .get, parameters: Parameters.init(),  headers: headers()).response{
            
            response in debugPrint(response)
            self.checkAuthenticationToken(statusCode: response.response!.statusCode as Int)

            switch response.result{
            case .success(let data):
                    
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    
                   
                    if(response.response?.statusCode == 200)
                    {
                        completionHandler(.success(json))
                        //  print(json)
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
    
    //    //MARK: - TaskList API
    func TaskListApicall(param :TaskListRequestModel,completionHandler :@escaping Handler ){
        //https://tgo.visilean.com/VisileanAPI/api/offline/project/D2802DE4-357B-F98A-E74B-9286D07C96B4/activity?actorGuid=9C8EC5C4-95D3-FBE3-7967-1C5C2E38EA31&endDateRange=1619604585226&limit=1000&startDateRange=1618943400000

        let TasklistURL = "https://tgo.visilean.com/VisileanAPI/api/offline/project/\(getProjectParameter().guid)/activity?actorGuid=\(param.actorGUID)&endDateRange=\(param.endDate)&limit=1000&startDateRange=\(param.startDate)"
        
        
        AF.request(TasklistURL, method: .get, parameters: Parameters.init(),  headers: headers()).response{
            
            response in debugPrint(response)
           self.checkAuthenticationToken(statusCode: response.response!.statusCode as Int)
//            if(response.response?.statusCode == 401)
//            {
//                tasklistVm.callTaskListApi()
//
//            }
            switch response.result{
            case .success(let data):
                
                print(response)
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    
                    if(response.response?.statusCode == 200 )
                    {
                        completionHandler(.success(json))
                       
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


//MARK: - Late_start_reasons
func LastestartAPIcall(param :String,completionHandler :@escaping Handler ){
//https://tgo.visilean.com/VisileanAPI/api/custom/reason/project/LATE_START_COMPLETION
   
    let latestartUrl =  "https://tgo.visilean.com/VisileanAPI/api/custom/reason/project/\(param)/LATE_START_COMPLETION"
    
    AF.request(latestartUrl, method: .get, parameters: Parameters.init(), headers: headers()).response{
        response in debugPrint(response)
        self.checkAuthenticationToken(statusCode: response.response!.statusCode as Int)
        switch response.result{
        case .success(let data):
                
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                
               
                if(response.response?.statusCode == 200)
                {
                    completionHandler(.success(json))
                    //  print(json)
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




//MARK: - ALLCOMPLETEDTASKLIST_API

    func allcompletedtask(skip : Int, completionHandler :@escaping Handler ){
  
        // https://tgo.visilean.com/VisileanAPI/api/filter/get/activities

        let allcompletedtaskURL = "https://tgo.visilean.com/VisileanAPI/api/filter/get/activities"
      
        let leaderboardmodel:LeaderBoardModel = LeaderBoardModel(activityTypes: ["DESIGN", "CONSTRUCTION"], projectGuid: "D438E2B5-7EA3-C620-38CF-4D3147E14BEC", sortDir: "ASC", dateEndCondition: "BEFOREON", limit: 50, isLeafOnly: true, skip: skip, sortField: "actualEndDate", depth: 0, recursive: false, dateStartCondition: "AFTERON", isFilterApplied: false, mulStatus: ["7"])
       
   
        AF.request(allcompletedtaskURL, method: .post,parameters: leaderboardmodel, encoder: JSONParameterEncoder.default,  headers: headers()).response{
            
            response in debugPrint(response)
           self.checkAuthenticationToken(statusCode: response.response!.statusCode as Int)

            switch response.result{
            case .success(let data):
                
                print(response)
                
                do{
                
                   let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    
                    if(response.response?.statusCode == 200 )
                    {
                        
                        completionHandler(.success(json))

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

//MARK: - 401 ERROR HANDLE

extension APImanager{
    func checkAuthenticationToken(statusCode : Int)
    {
        if(statusCode == 401)
        {
            callLoginAPI(param: (LoginRequest(email: UserDefaultData.sharedInstance.emailGLB, password: UserDefaultData.sharedInstance.passwordGLB))){(result) in
                    switch result{
                    case.success(let json):
                        let usernameFromResponse = (json as AnyObject).value(forKey: "username")as! String
                        let userGUIDFromResponse = (json as AnyObject).value(forKey: "userId")as! String
                        UserDefaults.standard.set(usernameFromResponse,forKey: "usernameUserDefault")
                        UserDefaults.standard.set(userGUIDFromResponse,forKey: "userGUIDUserDefault")
                        print(usernameFromResponse)
                        print(userGUIDFromResponse)
                        DispatchQueue.main.async {
                            UserDefaults.standard.set(true,forKey: "Login")
                           
                        }
                    case.failure(let err):
                        print(err.localizedDescription)
                       
                    }
                }
 
        }
        print("--------------------------")
    
    }
    
    //MARK :- Google drive
    
    func Gdrive(completionHandler :@escaping Handler ){
   // https://www.googleapis.com/drive/v3
        let latestartUrl =  "https://www.googleapis.com/drive/v3"
        
        AF.request(latestartUrl, method: .get, parameters: Parameters.init(), headers: headers()).response{
            response in debugPrint(response)
            self.checkAuthenticationToken(statusCode: response.response!.statusCode as Int)
            switch response.result{
            case .success(let data):
                    
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    
                   
                    if(response.response?.statusCode == 200)
                    {
                        completionHandler(.success(json))
                        //  print(json)
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
