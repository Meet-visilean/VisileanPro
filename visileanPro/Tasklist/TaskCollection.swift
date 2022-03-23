//
//  TaskCollection.swift
//  visileanPro
//
//  Created by Visilean Meet on 18/02/22.
//

import UIKit
import SideMenu

protocol TaskCellClick {
    func selectTaskRow(taskObj : TaskListResult)
}
protocol relodeCollectionViewPC {
    func reloadcolectionView()
}

class TaskCollection: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet var navBar: UINavigationBar!
    var collectionView = CollectionViewCell()
    var SelectedIndex : Int = 0
    @IBOutlet var taskListView: UIView!
    var TaskListData : [TaskListResult]? = nil
    private let manager = TaskListManager()
    @IBOutlet var HeaderCollectionView: UICollectionView!
    @IBOutlet var collectionViewMain: UICollectionView!
    
    var colectiondataa = CollectionViewCell()
    @IBOutlet var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar(navBar: navBar)
        taskListView.layer.cornerRadius = 40
        taskListView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner)
        
        TaskListData = manager.fetchTask()
        
        HeaderCollectionView.delegate = self
        HeaderCollectionView.dataSource = self
        collectionViewMain.dataSource = self
        collectionViewMain.delegate = self
        HeaderCollectionView.layer.cornerRadius = 20
        HeaderCollectionView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner,.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner)
        
        // HeaderCollectionView.addShadow(offset: CGSize.init(width: 3, height: 3), color: UIColor.black, radius: 5.0, opacity: 0.35)
        collectionViewMain.layer.cornerRadius = 40
        collectionViewMain.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner)
        
      
        self.SelectedIndex = 0
        collectionViewMain.scrollToItem(at:IndexPath(item: SelectedIndex, section: 0), at: .right, animated: true)
        collectionViewMain.reloadData()
        HeaderCollectionView.reloadData()
        
    }
    
    @IBAction func refreshBTNclick(_ sender: Any) {
        
     
            let Tasklist = TaskListVM()
            Tasklist.callTaskListApi()
        let ProjectList = ProjectListVM()
        ProjectList.callProjectListing()    
            
        
    }
    
    @IBAction func btnClickMenu(_ sender: Any) {
        let menu = SideMenuNavigationController(rootViewController: SideMenu())
        menu.leftSide=true
        present(menu, animated: true, completion: nil)
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
             
                HeaderCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                
            case 5:
                SelectedIndex = indexPath.row
                slideToNext()
             
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
            cell.taskClickDelegate = self
            cell.collectionIndex = indexPath.row//SelectedIndex
            cell.setupTableData()
          
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
            
            //MARK :- color change
            headerCell.HeaderLBL.textColor = .gray
            headerCell.HeaderLBL.font = UIFont(name:"System", size: 17.0)
            headerCell.SepratorView.backgroundColor = .white
            
            if SelectedIndex == indexPath.row
            {
                headerCell.HeaderLBL.textColor = .black
                headerCell.HeaderLBL.font = UIFont(name:"HelveticaNeue-Bold", size: 17.0)
                headerCell.SepratorView.backgroundColor = .red
            }
            else
            {
                headerCell.HeaderLBL.textColor = .gray
                headerCell.HeaderLBL.font = UIFont(name:"System", size: 17.0)
                headerCell.SepratorView.backgroundColor = .white
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

extension TaskCollection : TaskCellClick{
    func selectTaskRow(taskObj: TaskListResult) {
        let detailVC = self.storyboard!.instantiateViewController(withIdentifier: "TaskDetail") as! TaskDetail
        detailVC.taskdata = taskObj
        detailVC.relodeCollectionView = self
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
extension TaskCollection : relodeCollectionViewPC{
    func reloadcolectionView() {
        collectionViewMain.reloadData()
       
    }
    
}
