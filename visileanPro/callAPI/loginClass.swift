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

class APImanager{
    static let sharedInstance = APImanager()
    
    func callLoginAPI(login :LoginModel,completionHandler :@escaping Handler ){
        
        let headers : HTTPHeaders = [ .contentType("application/json")]
        
        let url = "https://tgo.visilean.com/VisileanAPI/authenticate?password=\(passwordd)&username=\(usernamee)"
        AF.request(url, method: .post, parameters: login, encoder: JSONParameterEncoder.default, headers: headers).response{
            
            response in debugPrint(response)
            
            switch response.result{
            case .success(let data):
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    
                    if(response.response?.statusCode == 200)
                    {
                        completionHandler(.success(json))
                        status.self = true
                    
                    }
                    else{
                        completionHandler(.failure(.custom(message: "Please check Network Conn")))
                        status.self = false
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
