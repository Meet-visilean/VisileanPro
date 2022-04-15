//
//  SceneDelegate.swift
//  visileanPro
//
//  Created by Visilean Meet on 02/02/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    static let navigate = SceneDelegate()
    var window: UIWindow?
    
     
    public class ActivityIndicatorWithLabel {
        var view = UIView()
        var progressView = UIView()
     public class var shared: ActivityIndicatorWithLabel {
         struct Static {
             static let instance: ActivityIndicatorWithLabel = ActivityIndicatorWithLabel()
         }
         return Static.instance
     }
     
     var pinchImageView = UIImageView()
     
     public func showProgressView() {
          view = UIView(frame: UIScreen.main.bounds)

         view.backgroundColor = UIColorFromHex(rgbValue: 0xffffff, alpha: 0.7)
         _ = NSData(contentsOf: Bundle.main.url(forResource: "loader", withExtension: "gif")!)
         let animatedImage = UIImage.gifImageWithName("loader")
          pinchImageView = UIImageView(image: animatedImage)
         pinchImageView.clipsToBounds = true
         pinchImageView.frame = CGRect(x: 0.0, y: 0.0, width: 130.0, height: 120.0)
        pinchImageView.center = view.center

         view.addSubview(pinchImageView)
         UIApplication.shared.keyWindow?.addSubview(view)
         UIApplication.shared.beginIgnoringInteractionEvents()

     }
     
     public func hideProgressView() {
         pinchImageView.removeFromSuperview()
         progressView.removeFromSuperview()
         view.removeFromSuperview()
         UIApplication.shared.endIgnoringInteractionEvents()
     }
     
     public func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
         let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
         let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
         let blue = CGFloat(rgbValue & 0xFF)/256.0
         return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
     }
        
      
        
    }
    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if UserDefaults.standard.bool(forKey: "Login") == true{
        
               let mainTabBarController = storyboard.instantiateViewController(identifier: "tabbar")
               window?.rootViewController = mainTabBarController
           } else {
      
               let loginNavController = storyboard.instantiateViewController(identifier: "LoginNAVcontroller")
               window?.rootViewController = loginNavController
           }

        guard let _ = (scene as? UIWindowScene) else { return }
    }
    func changeRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard let window = self.window else {
            return
        }
        
        // change the root view controller to your specific view controller
        window.rootViewController = vc
        UIView.transition(with: window,
                              duration: 0.5,
                              options: [.transitionFlipFromLeft],
                              animations: nil,
                              completion: nil)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        PersistentStoragedpr.shared.saveContext()
        PersistentStorage.shared.saveContext()
        PersistentStorageLateStartReason.shared.saveContext()
        PersistentStorageLeaderBoard.shared.saveContext()
       
    }


}

