//
//  CollectionViewCell.swift
//  visileanPro
//
//  Created by Visilean Meet on 18/02/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell,UITableViewDelegate,UITableViewDataSource{
    var TaskList : [TaskListResult] = []
    var taskClickDelegate : TaskCellClick?
    private let manager = TaskListManager()
    var specificTask : TaskListResult? = nil
    let cellReuseIdentifier = "cell"
    var TitleOfTableview : String = " "
    // var task

    var collectionIndex = 0
    @IBOutlet var tableView: UITableView!
    
    override func layoutSubviews() {
        tableView.layer.cornerRadius = 40
        tableView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner)
        super.layoutSubviews()
        tableView.reloadData()
        
    }
    
    func setupTableData()
    {
        tableView.delegate = self
        tableView.dataSource = self
        
        var finalTaskList : [TaskListResult] = []
        if let innerTaskList : [TaskListResult] = manager.fetchTask()
        {
            if collectionIndex == 0 // all task
            {
                finalTaskList = innerTaskList
            }
            else if collectionIndex == 1 // make ready
            {
                for obj in innerTaskList
                {
                    if obj.status == 1
                    {
                        finalTaskList.append(obj)
                    }
                }
            }
            else if collectionIndex == 2 // ready and force ready
            {
                for obj in innerTaskList
                {
                    if obj.status == 2 || obj.status == 3
                    {
                        finalTaskList.append(obj)
                    }
                }
            }
            else if collectionIndex == 3 // start  , warning , stop
            {
                for obj in innerTaskList
                {
                    if obj.status == 4 || obj.status == 5 || obj.status == 6
                    {
                        finalTaskList.append(obj)
                    }
                }
            }
            else if collectionIndex == 4 // reject
            {
                for obj in innerTaskList
                {
                    if obj.status == 8
                    {
                        finalTaskList.append(obj)
                    }
                }
            }
            else if collectionIndex == 5 // complete , qa check
            {
                for obj in innerTaskList
                {
                    if obj.status == 7 || obj.status == 9
                    {
                        finalTaskList.append(obj)
                    }
                }
            }
        }
        TaskList = finalTaskList
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return TitleOfTableview
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//          if TaskList.count == 0 {
//              self.tableView.setEmptyMessage("No Any Task")
//          } else {
//              
//          }
          return TaskList.count
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
        let selectedObj = TaskList[indexPath.row]
        selectedTaskDetail.instance.selectedTask = selectedObj.guid
        taskClickDelegate?.selectTaskRow(taskObj: selectedObj)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! tableTableViewCell
        
        let obj = TaskList[indexPath.row]
        cell.NameLBL.text = obj.name
        let dateFormatter = DateFormatter()
        cell.locationLBL.text = obj.activityLocation
        if(cell.locationLBL.text != "")
        {
            cell.locationIMG.image = UIImage(named: "location")

        }
       
     
   
     
        
        dateFormatter.dateFormat = "dd MMM "
        let startdate = dateFormatter.string(from: Date(milliseconds: obj.startDate ))
        cell.startDataLBL.text = startdate
        var ST = StatusToTaskstatusName(Status: obj.status)
        cell.statusBTN.setTitle(ST.0, for: .normal)
        cell.statusBTN.backgroundColor = ST.1
    
        return cell
        
    }
    
    
 
}
extension UITableView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}


