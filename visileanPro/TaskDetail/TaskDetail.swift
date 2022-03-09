//
//  TaskDetail.swift
//  visileanPro
//
//  Created by Visilean Meet on 04/03/22.
//

import UIKit

class TaskDetail: UIViewController {
    
    @IBOutlet var TaskNameLBL: UILabel!
    @IBOutlet var userBL: UILabel!
    @IBOutlet var orgnameLBL: UILabel!
    
    @IBOutlet var stopeBTn: UIButton!
    @IBOutlet var startBTN: UIButton!
    @IBOutlet var DateStatusLBL: UILabel!
    @IBOutlet var DateofTaskLBL: UILabel!
    @IBOutlet var planneddateLBL: UILabel!
    @IBOutlet var LocationLBL: UILabel!
    @IBOutlet var QuantitiesLBL: UILabel!
    var quantitiy : Int = 0
    @IBOutlet var statusBTN: UIButton!
    var selectedprojectguid : String = ""
    @IBOutlet var constructionBTN: UIButton!
    @IBOutlet var PriorityBTN: UIButton!
    @IBOutlet var ViewUpper: UIView!
    @IBOutlet var viewLower: UIView!
    @IBOutlet var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        selectedprojectguid = selectedTaskDetail.instance.selectedTask
        print(selectedprojectguid)
        
        
        
        
        mainView.backgroundColor = ViewUpper.backgroundColor
        ViewUpper.layer.cornerRadius = 100
        ViewUpper.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner)
        viewLower.layer.cornerRadius = 100
        viewLower.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner)
        
        //statusBTN.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner)
        statusBTN.layer.cornerRadius = 20
        statusBTN.addShadow(offset: CGSize.init(width: 0, height: 2), color: UIColor.black, radius: 3, opacity: 0.45)
        
        constructionBTN.layer.cornerRadius = 20
        constructionBTN.addShadow(offset: CGSize.init(width: 0, height: 2), color: UIColor.black, radius: 3, opacity: 0.45)
        
        PriorityBTN.layer.cornerRadius = 20
        PriorityBTN.addShadow(offset: CGSize.init(width: 0, height: 2), color: UIColor.black, radius: 3, opacity: 0.45)
        
        
        startBTN.layer.cornerRadius = 20
        startBTN.addShadow(offset: CGSize.init(width: 0, height: 2), color: UIColor.black, radius: 3, opacity: 0.45)
        
        stopeBTn.layer.cornerRadius = 20
        stopeBTn.addShadow(offset: CGSize.init(width: 0, height: 2), color: UIColor.black, radius: 3, opacity: 0.45)
        
        let taskdata = get(byIdentifier: selectedprojectguid)
        
        TaskNameLBL.text = taskdata?.name
        orgnameLBL.text = taskdata?.orgName
        
        quantitiy = taskdata?.trackingQuantityEstimate ?? 0
        QuantitiesLBL.text = String(quantitiy)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let startdate = dateFormatter.string(from: Date(milliseconds: taskdata?.startDate ?? 0))
        DateofTaskLBL.text = startdate
        
        
    }
    
    @IBAction func StatusBTNclick(_ sender: Any) {
        // let vc = StatusView()
        let registerViewController = self.storyboard?.instantiateViewController(withIdentifier: "statusViewController") as! statusViewController
        self.present(registerViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func TaskTypeBTN(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TaskType") as! TaskType
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func priority(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "priority") as! priority
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func startBTNtapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "startViewController") as! startViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func stopedBTNtapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Loader") as! Loader
        self.present(vc, animated: true, completion: nil)
    }
}
