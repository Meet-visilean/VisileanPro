//
//  TaskDetail.swift
//  visileanPro
//
//  Created by Visilean Meet on 04/03/22.
//

import UIKit


class TaskDetail: UIViewController {
    
    var taskdata : TaskListResult?
    
    @IBOutlet var TaskNameBTN: UIButton!
    @IBOutlet var userBL: UILabel!
    var relodeCollectionView : relodeCollectionViewPC!
    @IBOutlet var orgnameLBL: UILabel!
    @IBOutlet var DateStatusLBL: UILabel!
    @IBOutlet var DateofTaskLBL: UILabel!
    @IBOutlet var LocationLBL: UILabel!
    @IBOutlet var QuantitiesLBL: UILabel!
    @IBOutlet var PlannedEndDateLBL: UILabel!
    var quantitiy : Int = 0
    @IBOutlet var PlannedStartDateLBL: UILabel!
    @IBOutlet var statusBTN: UIButton!
    var selectedTaskguid : String = ""
    @IBOutlet var constructionBTN: UIButton!
    @IBOutlet var PriorityBTN: UIButton!
    @IBOutlet var ViewUpper: UIView!
    @IBOutlet var viewLower: UIView!
    @IBOutlet var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        selectedTaskguid = selectedTaskDetail.instance.selectedTask
        ViewUpper.layer.cornerRadius = 100
        ViewUpper.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner)
        viewLower.layer.cornerRadius = 100
        viewLower.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner)
        
        UIchange(taskdata: taskdata!)
        
    }
    
    func UIchange(taskdata : TaskListResult)
    {
        
        TaskNameBTN.setTitle("< \(taskdata.name)", for: .normal)
        
        LocationLBL.text = taskdata.activityLocation
        if(LocationLBL.text == "")
        {
            LocationLBL.text = "LOC"
        }
        orgnameLBL.text = taskdata.orgName
        
        quantitiy = taskdata.trackingQuantityEstimate
        
        QuantitiesLBL.text = String(quantitiy)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let startdate = dateFormatter.string(from: Date(milliseconds: taskdata.startDate ))
        let EndDate = dateFormatter.string(from: Date(milliseconds: Int64(taskdata.endDate )))
        PlannedStartDateLBL.text =  startdate
        PlannedEndDateLBL.text =   EndDate
        DateofTaskLBL.text = startdate
        //create function for name of status
        let statusOftask = ( StatusToTaskstatusName(Status: taskdata.status))
        constructionBTN.setTitle(taskdata.activityType, for: .normal)
        statusBTN.setTitle(statusOftask.0, for:.normal)
        //startBTN.backgroundColor = statusOftask.1
        
        ViewUpper.backgroundColor = statusOftask.1
        mainView.backgroundColor = ViewUpper.backgroundColor
        constructionBTN.setTitle(taskdata.activityType, for: .normal)
        
        statusBTN.layer.cornerRadius = 15
        statusBTN.addShadow(offset: CGSize.init(width: 0, height: 2), color: UIColor.black, radius: 3, opacity: 0.45)
        
        
        constructionBTN.layer.cornerRadius = 15
        constructionBTN.addShadow(offset: CGSize.init(width: 0, height: 2), color: UIColor.black, radius: 3, opacity: 0.45)
        
        PriorityBTN.layer.cornerRadius = 15
        PriorityBTN.addShadow(offset: CGSize.init(width: 0, height: 2), color: UIColor.black, radius: 3, opacity: 0.45)
        
        
        //
    }
    
    @IBAction func StatusBTNclick(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "statusViewController") as! statusViewController
        
        vc.TaskDetailData = taskdata
        vc.delegate = self
        
        self.present(vc, animated: true, completion: nil)
        
        
    }
    
    @IBAction func backBTNclick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func TaskTypeBTN(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TaskType") as! TaskType
        vc.TaskDetailData = taskdata
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func priority(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "priority") as! priority
        self.present(vc, animated: true, completion: nil)
    }
    
    
}
extension TaskDetail : changeTaskdetailUI{
    func changeUI(taskdata: TaskListResult) {
        relodeCollectionView.reloadcolectionView()
        UIchange(taskdata: taskdata)
        
    }
}
