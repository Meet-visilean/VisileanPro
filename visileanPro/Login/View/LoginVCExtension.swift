
import Foundation
import UIKit
var loginview = LoginView()
extension LoginView : LoginViewModelDelegate
{
    func didReceiveLoginResponse(loginResponse: LoginResponse?){
        
        if(loginResponse?.errorMessage == nil && loginResponse?.data != nil)
        {
            debugPrint("-------Navigate To main Page----------")
            UserDefaults.standard.set(true,forKey: "Login")
         
            Globe.shared.setTabbarRoot()
//            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "tabbar") as! tabbar
//            self.navigationController?.pushViewController(nextViewController, animated: true)
            
        }
        else if (loginResponse?.errorMessage != nil && loginResponse?.data == nil)
        {
            let alert = UIAlertController(title: "Error", message: loginResponse?.errorMessage, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
}

