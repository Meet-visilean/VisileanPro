//
//  AppDelegate.swift
//  visileanPro
//
//  Created by Visilean Meet on 02/02/22.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        
        if UserDefaults.standard.bool(forKey: "Login") == true
        {
            Globe.shared.setLoginRoot()
        }
        else
        {
            Globe.shared.setTabbarRoot()
        }
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
    
}

private func initialViewController() -> UIViewController {
    if (UserDefaults.standard.bool(forKey: "Login") == true){
        print("tabbar")
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbar") as! tabbar
        
    } else {
        print("login")
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginView")
        
    }
}
