//
//  statusViewController.swift
//  visileanPro
//
//  Created by Visilean Meet on 08/03/22.
//

import UIKit
protocol changeTaskdetailUI{
    func changeUI(taskdata: TaskListResult)
}
class statusViewController: UIViewController {

    @IBOutlet var closeBTN: UIButton!
    @IBOutlet var submitBTN: UIButton!
    @IBOutlet var mainView: UIView!
    
    //MARK :- status BTN
    
    @IBOutlet var notcommittedBTN: UIButton!
    private let manager = TaskListManager()
    @IBOutlet var readyBTN: UIButton!
    @IBOutlet var notreadyBTN: UIButton!
    var delegate : changeTaskdetailUI!
    @IBOutlet var forcereadyBTN: UIButton!
    var TaskDetailData : TaskListResult?
    @IBOutlet var qualitycheckedBTN: UIButton!
    @IBOutlet var rejectedBTN: UIButton!
    @IBOutlet var completeBTN: UIButton!
    @IBOutlet var stoppedBTN: UIButton!
    @IBOutlet var warningBTN: UIButton!
    @IBOutlet var startedBTN: UIButton!

  
    let radioController: RadioButtonController = RadioButtonController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 25
        mainView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner,.layerMinXMinYCorner)
        mainView.addShadow(offset: CGSize.init(width: 3, height: 3), color: UIColor.black, radius: 5.0, opacity: 0.35)
        submitBTN.layer.cornerRadius = 15
    
        submitBTN.addShadow(offset: CGSize.init(width: 2, height: 3), color: UIColor.black, radius: 3, opacity: 0.35)
        closeBTN.layer.cornerRadius = 15
     
        closeBTN.addShadow(offset: CGSize.init(width: 2, height: 3), color: UIColor.black, radius: 3, opacity: 0.35)
        radioController.buttonsArray = [notcommittedBTN,readyBTN,notreadyBTN,forcereadyBTN,qualitycheckedBTN,rejectedBTN,completeBTN,completeBTN,stoppedBTN,warningBTN,startedBTN]
       let defaultselectedBTN = defaultSelect(Status: TaskDetailData!.status)
               radioController.defaultButton = defaultselectedBTN
        // Do any additional setup after loading the view.
    }
    

    @IBAction func CloseBTNtapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //ststus BTN tapped
    
    @IBAction func notcommitedBTNclick(_ sender: Any) {
        radioController.buttonArrayUpdated(buttonSelected: sender as! UIButton)
    }
    
    @IBAction func notreadyBTNclicked(_ sender: Any) {
        
        radioController.buttonArrayUpdated(buttonSelected: sender as! UIButton)
    }
    
    @IBAction func readyBTNclick(_ sender: Any) {
        radioController.buttonArrayUpdated(buttonSelected: sender as! UIButton)
    }
    
    @IBAction func forceBTNclick(_ sender: Any) {
        radioController.buttonArrayUpdated(buttonSelected: sender as! UIButton)
    }
    
    @IBAction func startedBTnclick(_ sender: Any) {
        radioController.buttonArrayUpdated(buttonSelected: sender as! UIButton)
    }
    
    @IBAction func warningBTNclick(_ sender: Any) {
        radioController.buttonArrayUpdated(buttonSelected: sender as! UIButton)
    }
    
    @IBAction func stoppedBTNclick(_ sender: Any) {
        radioController.buttonArrayUpdated(buttonSelected: sender as! UIButton)
    }
    
    @IBAction func completeBTNclick(_ sender: Any) {
        radioController.buttonArrayUpdated(buttonSelected: sender as! UIButton)
    }
    
    @IBAction func rejectedBTnclick(_ sender: Any) {
        radioController.buttonArrayUpdated(buttonSelected: sender as! UIButton)
    }
    @IBAction func qaBTNclick(_ sender: Any) {
        radioController.buttonArrayUpdated(buttonSelected: sender as! UIButton)
    }
    
    
    @IBAction func submitBTNclick(_ sender: Any) {
        let selectedBTNcode =  SelectedBTNstatusCode()
        var taskdetail = TaskDetailData
        taskdetail?.status = selectedBTNcode

      manager.updateTaskStauts(taskListResult: taskdetail!)
      
       
        let updatedTask =  manager.gettaskdetaibyguid(guid: taskdetail!.guid)
        print(updatedTask as Any)
        self.dismiss(animated: true, completion: nil)
     
        delegate.changeUI(taskdata: updatedTask!)
      
    }
    
    private func displayAlert(alertMessage:String)
    {
        let alert = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }

    private func displayErrorAlert()
    {
        let errorAlert = UIAlertController(title: "Alert", message: "Something went wrong, please try again later", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        errorAlert.addAction(okAction)
        self.present(errorAlert, animated: true)
    }

    
    
    func SelectedBTNstatusCode()->Int
    {
        var statusCode = 0
        if(notcommittedBTN.isSelected == true)
        {
            statusCode = 0
        }
        else if(notreadyBTN.isSelected == true)
        {
            statusCode = 1
        }
        else if(readyBTN.isSelected == true)
        {
            statusCode = 2
        }
        else if(forcereadyBTN.isSelected == true)
        {
            statusCode = 3
        }
        else if(startedBTN.isSelected == true)
        {
            statusCode = 4
        }
        else if(warningBTN.isSelected == true)
        {
            statusCode = 5
        }
        else if(stoppedBTN.isSelected == true)
        {
            statusCode = 6
        }
        else if(completeBTN.isSelected == true)
        {
            statusCode = 7
        }
        else if(rejectedBTN.isSelected == true)
        {
            statusCode = 8
        }
        else if(qualitycheckedBTN.isSelected == true)
        {
            statusCode = 9
        }
        
        return statusCode
    }
   
        func defaultSelect(Status : Int) -> UIButton{
            
            switch (Status)  {
            case 0:
                return (notcommittedBTN)
                
            case 1:
                return (notreadyBTN)
            case 2:
                return (readyBTN)
            case 3:
                return (forcereadyBTN)
            case 4:
                return (startedBTN)
            case 5:
                return (warningBTN)
            case 6:
                return (stoppedBTN)
            case 7:
                return (completeBTN)
            case 8:
                return (rejectedBTN)
            case 9:
                return (qualitycheckedBTN)
            default:
                break
            }
            return (readyBTN)
        }
    
    
}
