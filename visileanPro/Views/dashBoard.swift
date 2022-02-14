//
//  dashBoard.swift
//  visileanPro
//
//  Created by Visilean Meet on 03/02/22.
//

import UIKit
import SideMenu
class dashBoard: UIViewController {

    @IBOutlet var DashboardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DashboardView.layer.cornerRadius = 40
        DashboardView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner)
    
    }


    @IBAction func MenuBTNclick(_ sender: Any) {
        let menu = SideMenuNavigationController(rootViewController: SideMenu())
       menu.leftSide=true
        present(menu, animated: true, completion: nil)
    }
  

}
