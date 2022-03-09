//
//  TaskCollection.swift
//  visileanPro
//
//  Created by Visilean Meet on 18/02/22.
//

import UIKit
import SideMenu

class TaskCollection: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var collectionView = CollectionViewCell()
    var SelectedIndex : Int = 0
    @IBOutlet var taskListView: UIView!
    var TaskListData : [TaskListResult]? = nil
    private let manager = TaskListManager()
    @IBOutlet var HeaderCollectionView: UICollectionView!
    @IBOutlet var collectionViewMain: UICollectionView!
    
    @IBOutlet var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
       
        taskListView.layer.cornerRadius = 40
        taskListView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner)
        
        TaskListData = manager.fetchTask()
        HeaderCollectionView.delegate = self
        HeaderCollectionView.dataSource = self
        collectionViewMain.dataSource = self
        collectionViewMain.delegate = self
        HeaderCollectionView.layer.cornerRadius = 20
        HeaderCollectionView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner,.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner)
        
        HeaderCollectionView.addShadow(offset: CGSize.init(width: 3, height: 3), color: UIColor.black, radius: 5.0, opacity: 0.35)
        collectionViewMain.reloadData()
        HeaderCollectionView.reloadData()
        
    }
    
    @IBAction func MenuBTNclick(_ sender: Any) {
        let menu = SideMenuNavigationController(rootViewController: SideMenu())
        menu.leftSide=true
        present(menu, animated: true, completion: nil)
    }
    //  case NotCommitted = 0 //     color =#EAEC60
    //    case NotReady = 1      color =  #D66657
    //    case Ready = 2         color = #59EEB6
    //    case ForceReady = 3    color =#afd027
    //    case Started = 4       color =  #541c60
    //    case Warning = 5       color = #f6bf40
    //    case Stopped = 6        color = #e40001
    //    case Complete = 7          color =#089331
    //    case Rejected = 8          color = #5a54b4
    //    case QualityChecked = 9        color =#014009
    
    
    
    func StatusToTaskstatusName(Status : Int) ->( String,UIColor){
        
        switch (Status)  {
        case 0:
            let color1 = hexStringToUIColor(hex: "#EAEC60")
            return ("NotCommitted",color1)
            
        case 1:
            let color1 = hexStringToUIColor(hex: "#D66657")
            return ("makeReady",color1)
        case 2:
            let color1 = hexStringToUIColor(hex: "#59EEB6")
            return ("Ready",color1)
        case 3:
            let color1 = hexStringToUIColor(hex: "#afd027")
            return ("ForceReady",color1)
        case 4:
            let color1 = hexStringToUIColor(hex: "#541c60")
            return ("Started",color1)
        case 5:
            let color1 = hexStringToUIColor(hex: "#f6bf40")
            return ("Warning",color1)
        case 6:
            let color1 = hexStringToUIColor(hex: "#e40001")
            return ("Stopped",color1)
        case 7:
            let color1 = hexStringToUIColor(hex: "#5a54b4")
            return ("Complete",color1)
        case 8:
            let color1 = hexStringToUIColor(hex: "#afd027")
            return ("Rejected",color1)
        case 9:
            let color1 = hexStringToUIColor(hex: "##014009")
            return ("QualityChecked",color1)
        default:
            break
        }
        let color1 = hexStringToUIColor(hex: "#EAEC60")
        return ("",color1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == collectionViewMain)
        {
            return 6
        }
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView == HeaderCollectionView)
        {
            _ = collectionView.cellForItem(at: indexPath) as! HeaderCell
            
            switch indexPath.row {
                
            case 0:
                SelectedIndex = indexPath.row
                slideToNext()
                HeaderCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                
            case 1:
                SelectedIndex = indexPath.row
                slideToNext()
                HeaderCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                
            case 2:
                SelectedIndex = indexPath.row
                slideToNext()
                HeaderCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                
                
            case 3:
                SelectedIndex = indexPath.row
                slideToNext()
                HeaderCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                
                
            case 4:
                SelectedIndex = indexPath.row
                slideToNext()
                print("04index")
                HeaderCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                
            case 5:
                SelectedIndex = indexPath.row
                slideToNext()
                print("05index")
                HeaderCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                
            default:  print("break")
                break
                
                // SelectedIndex = indexPath.row
            }
            
            HeaderCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewMain
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
            
            if(indexPath.row == 0)
            {
                
                cell.TitleOfTableview = "All Tasks"
	                let tasklist = self.TaskListData![0]
             //   let statusOftask = ( StatusToTaskstatusName(Status: tasklist.status))
               // cell.color = statusOftask.1
                cell.name = tasklist.name
                cell.projecguid = tasklist.projectGuid
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd-MM-yyyy hh:mm"
                let startdate = dateFormatter.string(from: Date(milliseconds: tasklist.startDate))
                cell.startdate = startdate
                cell.tableView.reloadData()
                
                
            }
            else if(indexPath.row == 1){
                cell.text = "-----make ready-----"
                cell.TitleOfTableview = "make ready"
                let tasklist = self.TaskListData![0]
                if(tasklist.status == 1 )
                {
                    let statusOftask = ( StatusToTaskstatusName(Status: tasklist.status))
                 //   cell.statusoftask = statusOftask.0
                    cell.name = tasklist.name
                    cell.projecguid = tasklist.projectGuid
                    //cell.color = statusOftask.1
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd-MM-yyyy "
                    let startdate = dateFormatter.string(from: Date(milliseconds: tasklist.startDate))
                    cell.startdate = startdate
                    
                }
                cell.tableView.reloadData()
                debugPrint(indexPath.row)
                debugPrint(SelectedIndex)
            }
            else if(indexPath.row == 2){
                cell.text = "----Ready-----"
                cell.TitleOfTableview = "Ready"
                let tasklist = self.TaskListData![0]
                if(tasklist.status == 2 || tasklist.status == 3 )
                {
                    let statusOftask = ( StatusToTaskstatusName(Status: tasklist.status))
                  //  cell.statusoftask = statusOftask.0
                 //  cell.projecguid = tasklist.projectGuid
                    cell.name = tasklist.name
                  //  cell.color = statusOftask.1
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd-MM-yyyy hh:mm"
                    let startdate = dateFormatter.string(from: Date(milliseconds: tasklist.startDate))
                    cell.startdate = startdate
                    
                }
                cell.tableView.reloadData()
                
            }
            else if(indexPath.row == 3){
                cell.text = "----In progress---"
                cell.TitleOfTableview = "In progress"
                let tasklist = self.TaskListData![0]
                if(tasklist.status == 4 || tasklist.status == 5 || tasklist.status == 6 )
                {
                    let statusOftask = ( StatusToTaskstatusName(Status: tasklist.status))
                  //  cell.statusoftask = statusOftask.0
                //    cell.projecguid = tasklist.projectGuid
                    cell.name = tasklist.name
                 //   cell.color = statusOftask.1
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd-MM-yyyy hh:mm"
                    let startdate = dateFormatter.string(from: Date(milliseconds: tasklist.startDate))
                    cell.startdate = startdate
                    
                }
                cell.tableView.reloadData()
                
            }
            else if(indexPath.row == 4){
                cell.text = "----Rejected---"
                cell.TitleOfTableview = "Rejected"
                let tasklist = self.TaskListData![0]
                if(tasklist.status == 8 )
                {
                    let statusOftask = ( StatusToTaskstatusName(Status: tasklist.status))
                   // cell.statusoftask = statusOftask.0
                  //  cell.color = statusOftask.1
                   // cell.projecguid = tasklist.projectGuid
                    cell.name = tasklist.name
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd-MM-yyyy hh:mm"
                    let startdate = dateFormatter.string(from: Date(milliseconds: tasklist.startDate))
                    cell.startdate = startdate
                    
                }
                cell.tableView.reloadData()
                
            }
            else if(indexPath.row == 5){
                cell.text = "----Quality check---"
                let tasklist = self.TaskListData![0]
                if(tasklist.status == 7 || tasklist.status == 9 )
                {
                    let statusOftask = ( StatusToTaskstatusName(Status: tasklist.status))
                  //  cell.statusoftask = statusOftask.0
                 //   cell.color = statusOftask.1
                    cell.name = tasklist.name
                  //  cell.projecguid = tasklist.projectGuid
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd-MM-yyyy hh:mm"
                    let startdate = dateFormatter.string(from: Date(milliseconds: tasklist.startDate))
                    cell.startdate = startdate
                    
                }
                cell.TitleOfTableview = "Quality check"
                cell.tableView.reloadData()
                
            }
            // SelectedIndex = indexPath.row
            cell.tableView.reloadData()
            return cell
        }
        else
        {
            
            let headerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            
            if(indexPath.row == 0)
            {
                headerCell.HeaderLBL.text = "All Task"
            }
            else if(indexPath.row == 1)
            {
                headerCell.HeaderLBL.text = "Make Ready"
            }
            else if(indexPath.row == 2)
            {
                headerCell.HeaderLBL.text = "Ready"
            }
            else if(indexPath.row == 3)
            {
                headerCell.HeaderLBL.text = "In progress"
            }
            else if(indexPath.row == 4)
            {
                headerCell.HeaderLBL.text = "Rejected"
                
            }
            else if(indexPath.row == 5)
            {
                headerCell.HeaderLBL.text = "Quality Check"
            }
            
            
            
            headerCell.HeaderLBL.textColor = .black
            
            if SelectedIndex == indexPath.row
            {
                headerCell.HeaderLBL.textColor = .red
            }
            else
            {
                headerCell.HeaderLBL.textColor = .black
            }
            
            return headerCell
        }
        
        
    }
    
    
    func slideToNext(){
        if SelectedIndex == 0
        {
            collectionViewMain.scrollToItem(at:IndexPath(item: SelectedIndex, section: 0), at: .right, animated: true)
            
        }
        else if SelectedIndex == 1
        {
            
            collectionViewMain.scrollToItem(at:IndexPath(item: SelectedIndex, section: 0), at: .right, animated: true)
            
        }
        else if SelectedIndex == 2
        {
            collectionViewMain.scrollToItem(at:IndexPath(item: SelectedIndex, section: 0), at: .right, animated: true)
            
        }
        else if SelectedIndex == 3
        {
            collectionViewMain.scrollToItem(at:IndexPath(item: SelectedIndex, section: 0), at: .right, animated: true)
            
        }
        else if SelectedIndex == 4
        {
            collectionViewMain.scrollToItem(at:IndexPath(item: SelectedIndex, section: 0), at: .right, animated: true)
            
        }
        else if SelectedIndex == 5
        {
            collectionViewMain.scrollToItem(at:IndexPath(item: SelectedIndex, section: 0), at: .right, animated: true)
            
        }
        HeaderCollectionView.reloadData()
        collectionViewMain.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if(collectionView == collectionViewMain)
        {
            return  CGSize(width: taskListView.frame.width, height: taskListView.frame.height)
        }
        else
        {
            return CGSize(width: 80 ,height: 60)
        }
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let OFFSet = collectionViewMain.contentOffset.x
        let width = collectionViewMain.frame.width
        let curIndex = (OFFSet/width)
        SelectedIndex = Int(curIndex)
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        HeaderCollectionView.scrollToItem(at: IndexPath(item: SelectedIndex, section: 0), at: .centeredHorizontally, animated: true)
        HeaderCollectionView.reloadData()
        
    }
}


func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
