//
//  TaskCollection.swift
//  visileanPro
//
//  Created by Visilean Meet on 18/02/22.
//

import UIKit

class TaskCollection: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    var SelectedIndex : Int = 0
    @IBOutlet var taskListView: UIView!
    
    
    @IBOutlet var HeaderCollectionView: UICollectionView!
    @IBOutlet var collectionViewMain: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HeaderCollectionView.delegate = self
        HeaderCollectionView.dataSource = self
        
        collectionViewMain.dataSource = self
        collectionViewMain.delegate = self
        
        
        
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
            let headerCell = collectionView.cellForItem(at: indexPath) as! HeaderCell
            switch indexPath.row {
                
            case 0:
                SelectedIndex = indexPath.row
                slideToNext()
                print("0index")
                print("currentmaincell")
                print(SelectedIndex)
                HeaderCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                
                
                
            case 1:
                SelectedIndex = indexPath.row
                slideToNext()
                print("01index")
                print("currentmaincell")
                print(SelectedIndex)
                HeaderCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                
                
                
                
            case 2:
                SelectedIndex = indexPath.row
                slideToNext()
                
                HeaderCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                print("currentmaincell")
                print("02index")
                print("currentmaincell")
                print(SelectedIndex)
                
            case 3:
                SelectedIndex = indexPath.row
                slideToNext()
                print("03index")
                HeaderCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                print("currentmaincell")
                print(SelectedIndex)
                
                
            case 4:
                SelectedIndex = indexPath.row
                slideToNext()
                print("04index")
                HeaderCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                
                print("currentmaincell")
                print(SelectedIndex)
                
            case 5:
                SelectedIndex = indexPath.row
                slideToNext()
                print("05index")
                HeaderCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                print("currentmaincell")
                
                print("currentmaincell")
                print(SelectedIndex)
                
            default:
                SelectedIndex = indexPath.row
                slideToNext()
            }
            
            //   HeaderCollectionView.reloadData()
        }
    }
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewMain
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
            
            if(indexPath.row == 0)
            {
                cell.backgroundColor = .yellow
                cell.TitleOfTableview = "All Tasks"
                cell.text = "----All task----"
                cell.tableView.reloadData()
                
                debugPrint(indexPath.row)
                debugPrint(SelectedIndex)
                
            }
            else if(indexPath.row == 1){
                cell.text = "-----make ready-----"
                cell.TitleOfTableview = "make ready"
                
                cell.tableView.reloadData()
                debugPrint(indexPath.row)
                debugPrint(SelectedIndex)
            }
            else if(indexPath.row == 2){
                cell.text = "----Ready-----"
                cell.TitleOfTableview = "Ready"
                
                cell.tableView.reloadData()
                debugPrint(indexPath.row)
                debugPrint(SelectedIndex)
            }
            else if(indexPath.row == 3){
                cell.text = "----In progress---"
                cell.TitleOfTableview = "In progress"
                
                cell.tableView.reloadData()
                debugPrint(indexPath.row)
                debugPrint(SelectedIndex)
            }
            else if(indexPath.row == 4){
                cell.text = "----Rejected---"
                cell.TitleOfTableview = "Rejected"
                
                cell.tableView.reloadData()
                debugPrint(indexPath.row)
                debugPrint(SelectedIndex)
            }
            else if(indexPath.row == 5){
                cell.text = "----Quality check---"
                
                cell.TitleOfTableview = "Quality check"
                cell.tableView.reloadData()
                debugPrint(indexPath.row)
                debugPrint(SelectedIndex)
            }
            // SelectedIndex = indexPath.row
            
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
        let curIndex = (OFFSet/width)
        SelectedIndex = Int(curIndex)
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        HeaderCollectionView.scrollToItem(at: IndexPath(item: SelectedIndex, section: 0), at: .centeredHorizontally, animated: true)
        HeaderCollectionView.reloadData()
    
    }
}

