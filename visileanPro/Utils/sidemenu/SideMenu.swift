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
    var items = ["","Dashboard","TaskList"]
    var ImageDetailMenu = ["house","message","person"]
    
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
        return 9
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
        if(indexPath.row == 1 || indexPath.row == 2 )
        {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cell",for: indexPath)
            cell.textLabel?.text = items[indexPath.row]
            cell.imageView?.image = UIImage(systemName: ImageDetailMenu[indexPath.row])
            
            return cell
        }
        
        // MARK:  - POTRAIT VS LANDSCAPE
        if UIDevice.current.orientation == .portrait {
            if(indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 6  )
            {
                let cell = tableView.dequeueReusableCell(withIdentifier:"cell",for: indexPath)
                cell.textLabel?.text = " "
                cell.isUserInteractionEnabled = false
                
                return cell
            }
            else if(indexPath.row == 7 )
            {
                let cell = tableView.dequeueReusableCell(withIdentifier:"cell",for: indexPath)
                cell.textLabel?.text = " _____________"
                cell.isUserInteractionEnabled = false
                
                return cell
            }
            
            else if(indexPath.row == 8 )
            {
                let cellSignout = tableView.dequeueReusableCell(withIdentifier:"signoutCell",for: indexPath) as! signoutCell
                // cell.configure(with:"image1")
                
                cellSignout.SignoutLBL!.text = "Sign Out"
                // cell.myIMG.image = image
                
                return cellSignout
                
                
            }
            tableView.reloadData()
        } else {
            //  cellSignout.isUserInteractionEnabled = false
            if(indexPath.row == 3 )
            {
                let cell = tableView.dequeueReusableCell(withIdentifier:"cell",for: indexPath)
                cell.textLabel?.text = " _____________"
                cell.isUserInteractionEnabled = false
                
                return cell
                //second cell
            }
            else if(indexPath.row == 4 )
            {
                let cellSignout = tableView.dequeueReusableCell(withIdentifier:"signoutCell",for: indexPath) as! signoutCell
                // cell.configure(with:"image1")
                
                cellSignout.SignoutLBL!.text = "Sign Out"
                // cell.myIMG.image = image
                return cellSignout
                
                
            }
            tableView.reloadData()
        }
        
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at:indexPath, animated: false)
        let temp = indexPath.row
        
        if(Int(temp) == 1)
        {
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "dashBoard") as! dashBoard
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: false)
        }
        else if(Int(temp) == 2)
        {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "taskList") as! taskList
            
            vc.hidesBottomBarWhenPushed = false
            self.navigationController?.pushViewController(vc, animated: false)
        }
        
        // MARK:  - POTRAIT VS LANDSCAPE
        
        if(Int(temp) == 8)
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
//                emailGLB = "Email Not Found"
//                passwordGLB = "Password Not Found"
//                loginGLB = false
//                tokenGLB = "Token Not Found"
//                usernameGLB = "Username not Found"
                UserDefaults.resetDefaults()
                //Navigate to LoginPage
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "LoginView") as! LoginView
                vc.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(vc, animated: false)
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
