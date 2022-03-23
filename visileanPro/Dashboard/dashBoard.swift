//
//  dashBoard.swift
//  visileanPro
//
//  Created by Visilean Meet on 03/02/22.
//

import UIKit
import SideMenu

class dashBoard: UIViewController {
    
    
  
    @IBOutlet var DPRcollectionView: UICollectionView!
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var DashboardView: UIView!
    var TaskDetailData : TaskListResult?
    var dprmodel : DPRmodel?
    private let alltaskmanager = LeaderBoardMAnager()
    var startdate : Int = 1
    var enddate : Int = 0
    var TaskStatusDetail : [String] = ["All Task In Progress","Tasks Completed","Task Quality Approved ","Tasks Marked For Rework","Tasks Stopped","Alert Raised"]
    
    @IBOutlet var datePicker: UIDatePicker!
    private let dprmanager = DPRmanager()
    let tasklistmanager = TaskListManager()
    var ProjectList = ProjectListVM()
   
  
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIApplication.shared.keyWindow?
       // let spinner = showLoader(view: self.view)
        //ActivityIndicatorWithLabel.shared.showProgressView(uiView: self.view)
        startdate = Int((datePicker.date.millisecondsSince1970) - 86400000)
        enddate = startdate + 86400000
        DPRcollectionView.dataSource = self
        DPRcollectionView.delegate = self
        setupNavigationBar(navBar: navBar)
        DashboardView.layer.cornerRadius = 40
        
        datePicker.center = view.center
        
        DashboardView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner)
        DashboardView.addShadow(offset: CGSize.init(width: 0, height: 2), color: UIColor.black, radius: 3, opacity: 0.45)
        ProjectList.delegate = self
        
        //MARK: -  Api call
       
        if(tasklistmanager.fetchTask()?.count == 0)
        {
            ProjectList.callProjectListing()
            let Tasklist = TaskListVM()
            Tasklist.callTaskListApi()			
        }

     
        //LeaderBoard Adddata to CoreData
        let leaderboard = LeaderBoardVM()
        let CDalltask =  alltaskmanager.fetchTask()
        if(CDalltask?.count == 0){
            leaderboard.callallcompletetaskAPI()
         
        }
      
      
        
        print("--------------------- CORE DB FILE ------------------------")
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        debugPrint(path[0])
     
        DPRcollectionView.reloadData()
        
        
    }
   
    override func viewDidAppear(_ animated: Bool) {
        DPRcollectionView.reloadData()
      }

    @IBAction func btnClickMenu(_ sender: Any) {
        let menu = SideMenuNavigationController(rootViewController: SideMenu())
        menu.leftSide=true
        present(menu, animated: true, completion: nil)
    }
    
    @IBAction func datechange(_ sender: Any) {

        //-------------change logic-----
        let date = datePicker.date
        startdate = Int((date.millisecondsSince1970))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let startdatee = dateFormatter.string(from: date)

        let dateFormatterr = DateFormatter()
       dateFormatterr.dateFormat = "dd/MM/yy"
        let datee = dateFormatterr.date(from: startdatee)
        startdate = Int((datee!.millisecondsSince1970))
        enddate = startdate + 86400000
        DPRcollectionView.reloadData()
        
    }
    
    
 
}

extension dashBoard : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        TaskStatusDetail.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DRPcollectionViewCell", for: indexPath) as! DRPcollectionViewCell
        cell.DetailLBL.text = TaskStatusDetail[indexPath.row]
        
        
        if(indexPath.row == 0)
        {
            let count4 = dprmanager.getDprData(status: 4,startdate: startdate,enddate: enddate)
            let count5 = dprmanager.getDprData(status: 5,startdate: startdate,enddate: enddate)
            let result = count4 + count5
            
            cell.TaskCountdrpLBL.text = String(describing: result)
            cell.TaskCountdrpLBL.textColor = UIColor(red: 37/255, green: 41/255, blue: 88/255, alpha: 1)
         
            cell.DetailLBL.textColor = UIColor(red: 37/255, green: 41/255, blue: 88/255, alpha: 1)
        }
        else if(indexPath.row == 1)
        {
            let result = dprmanager.getDprData(status: 7,startdate: startdate,enddate: enddate )
   
            cell.TaskCountdrpLBL.text = String(describing: result)
            cell.TaskCountdrpLBL.textColor =  UIColor(red: 9/255, green: 129/255, blue: 1/255, alpha: 255/255)
            cell.DetailLBL.textColor = UIColor(red: 9/255, green: 129/255, blue: 1/255, alpha: 255/255)
        }
        else if(indexPath.row == 2)
        {
            let result = dprmanager.getDprData(status: 9 ,startdate: startdate,enddate: enddate)
            cell.TaskCountdrpLBL.text = String(describing: result)
            cell.TaskCountdrpLBL.textColor = UIColor(red: 15/255, green: 110/255, blue: 152/255, alpha: 255/255)
         
            cell.DetailLBL.textColor = UIColor(red: 15/255, green: 110/255, blue: 152/255, alpha: 255/255)
        }
        else if(indexPath.row == 3)
        {
            let result = dprmanager.getDprData(status: 8 ,startdate: startdate,enddate: enddate)
            cell.TaskCountdrpLBL.text = String(describing: result)
            cell.TaskCountdrpLBL.textColor =  UIColor(red: 91/255, green: 85/255, blue: 181/255, alpha: 255/255)
      
            cell.DetailLBL.textColor =   UIColor(red: 91/255, green: 85/255, blue: 181/255, alpha: 255/255)
        }
        else if(indexPath.row == 4)
        {
            let result = dprmanager.getDprData(status: 6 ,startdate: startdate,enddate: enddate)
            cell.TaskCountdrpLBL.text = String(describing: result)
            cell.TaskCountdrpLBL.textColor =  UIColor(red: 253/255, green: 8/255, blue: 7/255, alpha: 255/255)
           
            cell.DetailLBL.textColor = UIColor(red: 253/255, green: 8/255, blue: 7/255, alpha: 255/255)
        }
        else if(indexPath.row == 5)
        {
            let result = dprmanager.getDprData(status: 5 ,startdate: startdate,enddate: enddate)
            cell.TaskCountdrpLBL.text = String(describing: result)
            cell.TaskCountdrpLBL.textColor =  UIColor(red: 187/255, green: 132/255, blue: 49/255, alpha: 255/255)
          
            cell.DetailLBL.textColor =  UIColor(red: 187/255, green: 132/255, blue: 49/255, alpha: 255/255)
        }
        return cell
        
    }
    
    
}


