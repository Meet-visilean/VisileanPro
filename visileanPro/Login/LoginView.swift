//
//  LoginView.swift
//  visileanPro
//
//  Created by Visilean Meet on 02/02/22.
//

import UIKit
import SwiftyJSON
import IQKeyboardManagerSwift

class LoginView: UIViewController {
    
    @IBOutlet var designView: UIView!
    @IBOutlet var LoginBTN: UIButton!
    @IBOutlet var UsernameTXT: UITextField!
    @IBOutlet var PasswordTXT: UITextField!
    @IBOutlet var ForgetPasswordLBL: UIButton!
    @IBOutlet var passwordLBL: UILabel!
    var loginVM = LoginViewVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginVM.delegate = self
        print(UserDefaultData.sharedInstance.emailGLB)
        print(UserDefaultData.sharedInstance.passwordGLB)
        print(UserDefaultData.sharedInstance.loginGLB)
        designView.layer.cornerRadius = 40
        designView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner)
        LoginBTN.addShadow(offset: CGSize.init(width: 3, height: 3), color: UIColor.black, radius: 5.0, opacity: 0.35)
        UsernameTXT.addShadow(offset: CGSize.init(width: 0, height: 2), color: UIColor.black, radius: 2.2, opacity: 0.35)
        PasswordTXT.addShadow(offset: CGSize.init(width: 0, height: 2), color: UIColor.black, radius: 2.2, opacity: 0.35)
    }
    
    @IBAction func LoginBTNclick(_ sender: Any) {
        guard let username = UsernameTXT.text else{return}
        guard let password = PasswordTXT.text else{return}
        UserDefaults.standard.set(username,forKey: "email")
        UserDefaults.standard.set(password,forKey: "password")
        let request = LoginRequest(email: UsernameTXT.text, password:PasswordTXT.text)
        loginVM.loginUser(loginRequest: request)
        
        
    }
    
}
