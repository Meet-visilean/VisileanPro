//
//  taskList.swift
//  visileanPro
//
//  Created by Visilean Meet on 03/02/22.
//

import UIKit
import SideMenu

class Setting: UIViewController {
  
    @IBOutlet var SettingView: UIView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        SettingView.layer.cornerRadius = 40
        SettingView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner)
       
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) { // As soon as vc appears
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = false
    }
    @IBAction func MenuBTNclik(_ sender: Any) {
        let menu = SideMenuNavigationController(rootViewController: SideMenu())
        menu.leftSide=true
        present(menu, animated: true, completion: nil)
      
    
    }


}
