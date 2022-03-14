//
//  Globe.swift
//  visileanPro
//
//  Created by hapy gohil on 13/03/22.
//

import Foundation
import UIKit

class Globe{
    static let shared = Globe()
    
    func setLoginRoot() {
        
        guard let rootVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginView") as? LoginView else {
            return
        }
        let navigationController = UINavigationController(rootViewController: rootVC)
        self.setRootWindow(navigation: navigationController)
    }
    
    
    func setTabbarRoot() {
        guard let rootVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbar") as? tabbar else {
            return
        }
        
        let navigationController = UINavigationController(rootViewController: rootVC)
        self.setRootWindow(navigation: navigationController)
    }
    
    
    func setRootWindow(navigation : UINavigationController)
    {
        if #available(iOS 15, *) {
            let keyWindow = UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .compactMap({$0 as? UIWindowScene})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first
            
            keyWindow?.rootViewController = navigation
            keyWindow?.makeKeyAndVisible()
        }
        else
        {
            UIApplication.shared.windows.first?.rootViewController = navigation
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
    
    func setRootView(navigation : UIViewController)
    {
        if #available(iOS 15, *) {
            let keyWindow = UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .compactMap({$0 as? UIWindowScene})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first
            
            keyWindow?.rootViewController = navigation
            keyWindow?.makeKeyAndVisible()
        }
        else
        {
            UIApplication.shared.windows.first?.rootViewController = navigation
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
    
}


extension UIViewController
{
    func setupNavigationBar(navBar : UINavigationBar)
    {
        navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
        navBar.backgroundColor = UIColor.clear
        navBar.tintColor = UIColor.white
        
        navBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white,
             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        self.navigationController?.isNavigationBarHidden = true
        self.view.layoutIfNeeded()
        self.navigationController?.navigationBar.barStyle = .black;
    }
    func setupNavigationBarWhite(navBar : UINavigationBar)
    {
        navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
        navBar.backgroundColor = UIColor.clear
        navBar.tintColor = UIColor.clear
        
        navBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        
        self.navigationController?.isNavigationBarHidden = true
//        self.view.layoutIfNeeded()
        self.navigationController?.navigationBar.barStyle = .default;
    }
}
