//
//  TaskType.swift
//  visileanPro
//
//  Created by Visilean Meet on 08/03/22.
//

import UIKit

class TaskType: UIViewController {
    @IBOutlet var tableview: UITableView!
    @IBOutlet var submitBNT: UIButton!
    var TaskDetailData : TaskListResult?
    @IBOutlet var closeBTN: UIButton!
    var delegate : changeTaskdetailUI!
    private let manager = TaskListManager()
    let TaskType : [String] = ["DESIGN","CONSTRUCTION"]
    let TaskImage : [String] = ["design","construction"]
    @IBOutlet var mainView: UIView!
    var SelectedIndex : Int = 0
    var SelectedTask = ""
    var updatedTask : TaskListResult? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        updatedTask =  manager.gettaskdetaibyguid(guid: TaskDetailData!.guid)
        tableview.delegate = self
        tableview.dataSource = self
        mainView.layer.cornerRadius = 25
        mainView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner,.layerMinXMinYCorner)
        mainView.addShadow(offset: CGSize.init(width: 3, height: 3), color: UIColor.black, radius: 5.0, opacity: 0.35)
        submitBNT.layer.cornerRadius = 15
        closeBTN.layer.cornerRadius = 15
        closeBTN.addShadow(offset: CGSize.init(width: 2, height: 3), color: UIColor.black, radius: 3, opacity: 0.35)
        submitBNT.addShadow(offset: CGSize.init(width: 2, height: 3), color: UIColor.black, radius: 3, opacity: 0.35)
        
        tableview.reloadData()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        defaultSelect()
        
    }
    func defaultSelect()
    {
        
        if(updatedTask?.activityType == "DESIGN")
        {
            
            SelectedIndex = 1
        }
        else if(updatedTask?.activityType == "CONSTRUCTION"){
            SelectedIndex = 0
            
        }
    }
    @IBAction func closeBTNclick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func submitBTNclick(_ sender: Any) {
        
        var taskdetail = TaskDetailData
        if(SelectedIndex == 1)
        {
            taskdetail?.activityType = "DESIGN"
        }
        else if(SelectedIndex == 0)
        {
            
            taskdetail?.activityType = "CONSTRUCTION"
        }
        
        manager.updateTaskActivityType(taskListResult: taskdetail!)
        updatedTask =  manager.gettaskdetaibyguid(guid: taskdetail!.guid)
        self.dismiss(animated: true, completion: nil)
        delegate.changeUI(taskdata: updatedTask!)
    }
}

extension TaskType : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TaskType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTypeTableViewCell", for: indexPath) as! TaskTypeTableViewCell
        
        cell.TasknameLBL.text = TaskType[indexPath.row]
        cell.TaskIMG.image =  UIImage(named: TaskImage[indexPath.row])
        if SelectedIndex == indexPath.row
        {
            cell.TasknameLBL.font = UIFont(name:"system", size: 17.0)
            cell.TasknameLBL.textColor = .systemGray3
        }
        else
        {
            cell.TasknameLBL.textColor = .black
            cell.TasknameLBL.font = UIFont(name:"HelveticaNeue-Bold", size: 17.0)
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        SelectedIndex = indexPath.row
        tableview.reloadData()
        
        
    }
}
