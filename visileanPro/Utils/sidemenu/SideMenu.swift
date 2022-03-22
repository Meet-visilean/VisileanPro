//
//  SideMenu.swift
//  visileanPro
//
//  Created by Visilean Meet on 03/02/22.
//

import UIKit
import SideMenu

class SideMenu: UITableViewController {
    
    var menu : SideMenuNavigationController?
    var items = ["","Dashboard","TaskList","LeaderBoard"]
    var ImageDetailMenu = ["house","house","list.bullet","person.fill"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu = SideMenuNavigationController(rootViewController: SideMenu())
        
        // SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        tableView.register(profilecellTableViewCell.nib(), forCellReuseIdentifier : "profilecellTableViewCell")
        tableView.register(signoutCell.nib(), forCellReuseIdentifier : "signoutCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier : "cell")
        self.tableView.separatorColor = UIColor.clear
        
        
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell",for: indexPath)
        if(indexPath.row == 0)
        {
            let cell1 = tableView.dequeueReusableCell(withIdentifier:"profilecellTableViewCell",for: indexPath) as! profilecellTableViewCell
            // cell.configure(with:"image1")
            //var image : UIImage = UIImage(named: "image1")!
            
            cell1.UserNameLBL!.text = UserDefaults.standard.string(forKey: "usernameUserDefault")
            // cell.myIMG.image = image
            return cell1
        }
        if(indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 )
        {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cell",for: indexPath)
            cell.textLabel?.text = items[indexPath.row]
            cell.imageView?.image = UIImage(systemName: ImageDetailMenu[indexPath.row])
            cell.isUserInteractionEnabled = true
            return cell
        }
        
        if(indexPath.row == 4 )
        {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cell",for: indexPath)
            cell.textLabel?.text = " _____________"
            cell.isUserInteractionEnabled = false
            
            return cell
            //second cell
        }
            if(indexPath.row == 5 )
            {
                let cellSignout = tableView.dequeueReusableCell(withIdentifier:"signoutCell",for: indexPath) as! signoutCell
                // cell.configure(with:"image1")
                
                cellSignout.SignoutLBL!.text = "Sign Out"
                
                return cellSignout
                
                
            }
          
        
        tableView.reloadData()
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  tableView.deselectRow(at:indexPath, animated: false)
       
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabs = storyboard.instantiateViewController(withIdentifier: "tabbar") as! tabbar
        
        if(indexPath.row == 1)
        {
            tabs.selectedIndex = 0
            Globe.shared.setRootView(navigation: tabs)
        }
        else if(indexPath.row == 2)
        {
            tabs.selectedIndex = 1
            Globe.shared.setRootView(navigation: tabs)
        }
        else if(indexPath.row == 3)
        {
            tabs.selectedIndex = 2
            Globe.shared.setRootView(navigation: tabs)
            
        }
        else if(indexPath.row == 5)
        {
            
            let alert = UIAlertController(title: "LogOut", message: "Are you sure want to LogOut?", preferredStyle: .alert)
            // Create the actions
            let okAction = UIAlertAction(title: "YES", style:
                                            UIAlertAction.Style.default) {
                UIAlertAction in
                print("Yes Pressed")
                // Reset User Defaults
                
                
                UserDefaults.standard.removeObject(forKey:"Login")
                UserDefaults.standard.removeObject(forKey:"TOKEN")
                UserDefaults.standard.removeObject(forKey:"email")
                UserDefaults.standard.removeObject(forKey:"password")

                UserDefaults.resetDefaults()
                
                Globe.shared.setLoginRoot()
            }
            let cancelAction = UIAlertAction(title: "CANCEL", style:
                                                UIAlertAction.Style.cancel) {
                UIAlertAction in
                print("Cancel Pressed")
            }
            // Add the actions
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            
            self.present(alert, animated: true, completion: nil)
            
            
            
            
        }
        
        
    }
    
    
    
}
extension UserDefaults {
    static func resetDefaults() {
        if let username = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: username)
        }
        if let password = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: password)
        }
    }
}
