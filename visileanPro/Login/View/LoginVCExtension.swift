
import Foundation
import UIKit
var loginview = LoginView()

extension LoginView : LoginViewModelDelegate
{
    func StopLoader(){SceneDelegate.ActivityIndicatorWithLabel.shared.hideProgressView()
        print("Endloginloader")
    }
    func didReceiveLoginResponse(loginResponse: LoginResponse?){
        
        if(loginResponse?.errorMessage == nil && loginResponse?.data != nil)
        {
            debugPrint("-------Navigate To main Page----------")
            UserDefaults.standard.set(true,forKey: "Login")
            StopLoader()
            Globe.shared.setTabbarRoot()
            
        }
        else if (loginResponse?.errorMessage != nil && loginResponse?.data == nil)
        {
            StopLoader()
            let alert = UIAlertController(title: "Error", message: loginResponse?.errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
}

