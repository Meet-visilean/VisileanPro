//
//  SettingViewController.swift
//  visileanPro
//
//  Created by Visilean Meet on 11/03/22.
//

import UIKit
import SideMenu

class SettingViewController: UIViewController {

    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var settingView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(navBar: navBar)
        settingView.layer.cornerRadius = 40
       
        settingView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner)
        settingView.addShadow(offset: CGSize.init(width: 0, height: 2), color: UIColor.black, radius: 3, opacity: 0.45)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnClickMenu(_ sender: Any) {
        let menu = SideMenuNavigationController(rootViewController: SideMenu())
        menu.leftSide=true
        present(menu, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
