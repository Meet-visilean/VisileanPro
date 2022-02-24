//
//  LoginView.swift
//  visileanPro
//
//  Created by Visilean Meet on 02/02/22.
//

import UIKit
import SwiftyJSON

class LoginView: UIViewController {
    
    @IBOutlet var designView: UIView!
    @IBOutlet var LoginBTN: UIButton!
    @IBOutlet var UsernameTXT: UITextField!
    @IBOutlet var PasswordTXT: UITextField!
    let modelLogin =  LoginModel(username: usernamee, password: passwordd)
    let login = "login"
    
    @IBOutlet var ForgetPasswordLBL: UIButton!
    @IBOutlet var passwordLBL: UILabel!
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        hidePassword()
        
        if (UserDefaults.standard.bool(forKey: "Login") == true)
        {
            pushTomainscreen()
        }
        
        designView.layer.cornerRadius = 40
        designView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner)
        
        LoginBTN.addShadow(offset: CGSize.init(width: 3, height: 3), color: UIColor.black, radius: 5.0, opacity: 0.35)
        
        UsernameTXT.addShadow(offset: CGSize.init(width: 0, height: 2), color: UIColor.black, radius: 2.2, opacity: 0.35)
        
        PasswordTXT.addShadow(offset: CGSize.init(width: 0, height: 2), color: UIColor.black, radius: 2.2, opacity: 0.35)
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    var i = 0
    @IBAction func LoginBTNclick(_ sender: Any) {
        guard let username = UsernameTXT.text else{return}
        guard let password = PasswordTXT.text else{return}
      
        usernamee.self = username
        passwordd.self = password
        
        
        if let email = UsernameTXT.text
        {
            if let errorMessage = invalidEmail(email)
            {
                //useremail not valid
                alert(message: errorMessage)
                i = 0
                passwordLBL.isHidden = true
                PasswordTXT.isHidden = true
                
                
            }
            else
                //if user email valid then show password field
            {
                
                passwordLBL!.isHidden = false
                PasswordTXT!.isHidden = false
                ForgetPasswordLBL.isHidden = false
                
                
                if let password = PasswordTXT!.text
                {
                    if(i==1){
                        callLoginApi()
                        if(status.self == true)
                        {
                            
                            UserDefaults.standard.set(true,forKey: "Login")
                            UserDefaults.standard.set(username,forKey: "username")
                            pushTomainscreen()
                        }
                        else{
                            alert(message: "enter valid password")
                        }
                    }
                
                    else
                    {
                        self.i = 1
                    }
                }
            }
        }
    }
    
    
    
func callLoginApi(){
    APImanager.sharedInstance.callLoginAPI(login: modelLogin) {(result) in
        switch result{
        case.success(let json):
            print(json as AnyObject)
            
            let username = (json as AnyObject).value(forKey: "username")as! String
            print(username)

        case.failure(let err):
            print(err.localizedDescription)
            self.alert(message: "enter valid password")
        }
    }
}
    func hidePassword()
    {
        // submitBTN.isEnabled = false
        PasswordTXT.isHidden = true
        passwordLBL.isHidden = true
        ForgetPasswordLBL.isHidden = true
        
    }
    func pushTomainscreen()
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "tabbar") as! tabbar
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

