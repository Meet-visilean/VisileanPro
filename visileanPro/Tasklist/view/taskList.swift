//
//  taskList.swift
//  visileanPro
//
//  Created by Visilean Meet on 03/02/22.
//

import UIKit
import SideMenu

class taskList: UIViewController {
  
    @IBOutlet var TasklistView: UIView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        TasklistView.layer.cornerRadius = 40
        TasklistView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner)
       
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) { // As soon as vc appears
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = false
    }
//
//    override func viewWillDisappear(_ animated: Bool) { // As soon as vc disappears
//        super.viewWillDisappear(true)
//        self.tabBarController?.tabBar.isHidden = true
//    }

    @IBAction func MenuBTNclik(_ sender: Any) {
        let menu = SideMenuNavigationController(rootViewController: SideMenu())
        menu.leftSide=true
        present(menu, animated: true, completion: nil)
      
    
    }


}
