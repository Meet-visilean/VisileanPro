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
    var currentdate : Int = 0
    @IBOutlet var notcommittedBTN: UIButton!
    private let manager = TaskListManager()
    @IBOutlet var readyBTN: UIButton!
    @IBOutlet var notreadyBTN: UIButton!
    var delegate : changeTaskdetailUI!
    @IBOutlet var forcereadyBTN: UIButton!
    var TaskDetailData : TaskListResult?
    var dprmodel : DPRmodel?
    var reasonsForlate : [String] = []
    private let dprmanager = DPRmanager()
    @IBOutlet var qualitycheckedBTN: UIButton!
    @IBOutlet var rejectedBTN: UIButton!
    @IBOutlet var completeBTN: UIButton!
    @IBOutlet var stoppedBTN: UIButton!
    @IBOutlet var warningBTN: UIButton!
    @IBOutlet var startedBTN: UIButton!
    @IBOutlet var notcommitLBL: UILabel!
    @IBOutlet var notRedy: UILabel!
    @IBOutlet var redyLBL: UILabel!
    @IBOutlet var forceLBL: UILabel!
    @IBOutlet var startedLBL: UILabel!
    @IBOutlet var warningLBL: UILabel!
    @IBOutlet var stoppedLBL: UILabel!
    @IBOutlet var rejectedLBL: UILabel!
    @IBOutlet var completeLBL: UILabel!
    
    
    @IBOutlet var qaLBL: UILabel!
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

      
        UIchange()
       
    }
   func UIchange()
    {
        let updatedTask =  manager.gettaskdetaibyguid(guid: TaskDetailData!.guid)
        let defaultselectedBTN = defaultSelect(Status: updatedTask!.status)
        
         radioController.defaultButton = defaultselectedBTN.0
            
      
        var enablestatus =  callForWorkForceOn(currentStatus: updatedTask!.status)
         disable(array : enablestatus)
         
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
      
        currentdate = Int(Date().millisecondsSince1970)
        var resonpageshow4 : Bool = false
        var resonpageshow7 : Bool = false
        
        if(taskdetail!.actualStartDate < currentdate)
        //if start actual date is missed
            {resonpageshow4 = true}
        else
            {resonpageshow4 = false}
        
        if(taskdetail!.actualEndDate < currentdate)
        //if start actual enddate is missed OR complete late
            {resonpageshow7 = true}
        else
            {resonpageshow7 = false}
        
        
        if((selectedBTNcode == 4 && resonpageshow4 == true) || (selectedBTNcode == 7 && resonpageshow7 == true) || selectedBTNcode == 5 || selectedBTNcode == 6 )
        {
            if(reasonsForlate.count == 0)
            {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "startViewController") as! startViewController
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
                
            }
            else{
                manager.updateTaskStauts(taskListResult: taskdetail!)
               
                let updatedTask =  manager.gettaskdetaibyguid(guid: taskdetail!.guid)
                dprmanager.createDPR(DPRmodel: updatedTask!, acurrentdate: currentdate,latestartreason: reasonsForlate)
                self.dismiss(animated: true, completion: nil)

                delegate.changeUI(taskdata: updatedTask!)
            }
          
        }
    
  
        else{
            manager.updateTaskStauts(taskListResult: taskdetail!)
           
            let updatedTask =  manager.gettaskdetaibyguid(guid: taskdetail!.guid)
            currentdate = Int(Date().millisecondsSince1970)
            dprmanager.createDPR(DPRmodel: updatedTask!, acurrentdate: currentdate,latestartreason: reasonsForlate)
            self.dismiss(animated: true, completion: nil)
    
            delegate.changeUI(taskdata: updatedTask!)
        }
        
      
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

    func callForWorkForceOn(currentStatus : Int ) -> [Int]
      {
      
          var enableStatus : [Int] = []
        if currentStatus == 0
        {
          enableStatus = [2,4,5,6,7,8,9]        //0,1,3
        }
        else if currentStatus == 1
        {
          enableStatus = [0,2,4,5,6,7,8,9]  //1,3
        }
        else if currentStatus == 2
        {
          enableStatus = [0,1,3,5,6,7,8,9]      //2,4
        }
        else if currentStatus == 3
        {
            enableStatus = [0,1,2,5,6,7,8,9]      //3,4
        }
        else if currentStatus == 4
        {
          enableStatus = [0,1,2,3,8,9]  //4,5,6,7
        }
        else if currentStatus == 5
        {
          enableStatus = [0,1,2,3,7,8,9]    //4,5,6
        }
        else if currentStatus == 6
        {
          enableStatus = [0,1,2,3,5,7,8,9]      //4,6
        }
        else if currentStatus == 7
        {
          enableStatus = [0,1,2,3,4,5,6]    //7,8,9
        }
        else if currentStatus == 8
        {
          enableStatus = [0,1,2,3,5,6,7,9] //4,8
        }
        else if currentStatus == 9
        {
          enableStatus = [0,1,2,3,4,5,6,7,8]   //9
        }
          return  enableStatus
      }
    
    func disable(array : [Int]){
        var i = 0
        
        var temp = array.count
        //[4,8]
        while (temp != 0)
        {
            let index =  defaultSelect(Status: array[i])
            index.0.isUserInteractionEnabled = false
            index.0.backgroundColor = .systemGray6
            index.1.textColor = UIColor.systemGray6
            //btn.isEnabled = false
            i = i + 1
            temp = temp - 1
        }
      //  editButton.userInteractionEnabled = false
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
   
    func defaultSelect(Status : Int) -> (UIButton,UILabel){
            
            switch (Status)  {
            case 0:
                return (notcommittedBTN,notcommitLBL)
            case 1:
                return (notreadyBTN,notRedy)
            case 2:
                return (readyBTN,redyLBL)
            case 3:
                return (forcereadyBTN,forceLBL)
            case 4:
                return (startedBTN,startedLBL)
            case 5:
                return (warningBTN,warningLBL)
            case 6:
                return (stoppedBTN,stoppedLBL)
            case 7:
                return (completeBTN,completeLBL)
            case 8:
                return (rejectedBTN,rejectedLBL)
            case 9:
                return (qualitycheckedBTN,qaLBL)
            default:
                break
            }
            return (readyBTN,redyLBL)
        }
    
    
}
extension statusViewController : resonforlateonstart {
    func sendresonTochangestatus(arr: [String]) {
        reasonsForlate = arr
       
    }
    
    
}
