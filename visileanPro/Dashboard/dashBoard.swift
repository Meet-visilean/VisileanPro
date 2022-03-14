//
//  dashBoard.swift
//  visileanPro
//
//  Created by Visilean Meet on 03/02/22.
//

import UIKit
import SideMenu

class dashBoard: UIViewController {


    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var DashboardView: UIView!
    var ProjectList = ProjectListVM()
    var Tasklist = TaskListVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(navBar: navBar)
        DashboardView.layer.cornerRadius = 40
       
        DashboardView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner)
        DashboardView.addShadow(offset: CGSize.init(width: 0, height: 2), color: UIColor.black, radius: 3, opacity: 0.45)
        ProjectList.delegate = self
    
        ProjectList.callProjectListing()
        
        Tasklist.callTaskListApi()
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        debugPrint(path[0])
    }

    @IBAction func btnClickMenu(_ sender: Any) {
        let menu = SideMenuNavigationController(rootViewController: SideMenu())
        menu.leftSide=true
        present(menu, animated: true, completion: nil)
    }
    
    
}
