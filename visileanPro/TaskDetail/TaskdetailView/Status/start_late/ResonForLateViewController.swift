//
//  ResonForLateViewController.swift
//  visileanPro
//
//  Created by Visilean Meet on 09/03/22.
//

import UIKit

protocol resonforlateonstartBTN{
    func sendreson(arr : [String])
}

class ResonForLateViewController: UIViewController {
    @IBOutlet var closeBTN: UIButton!
    var selectedRows = [IndexPath]()
    @IBOutlet var submitBTN: UIButton!
    var lateReasonmanager = latestartmanager()
    var reasons : [String] = []
    var lateresons : [latestartlistModel]?

    var reasonsSend : [String] = []
    var delegate : resonforlateonstartBTN!
    var selectedreason : String = ""
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        lateresons = lateReasonmanager.fetchTask()
        mainView.layer.cornerRadius = 25
        mainView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner,.layerMinXMinYCorner)
        mainView.addShadow(offset: CGSize.init(width: 3, height: 3), color: UIColor.black, radius: 5.0, opacity: 0.35)
        closeBTN.layer.cornerRadius = 15
        closeBTN.addShadow(offset: CGSize.init(width: 2, height: 3), color: UIColor.black, radius: 3, opacity: 0.35)
        submitBTN.layer.cornerRadius = 15
        submitBTN.addShadow(offset: CGSize.init(width: 2, height: 3), color: UIColor.black, radius: 3, opacity: 0.35)
        appendCDtoarray()
    }
    
    func appendCDtoarray()
    {
        var i = 0
        var temp = lateresons?.count
        while(temp != 0)
        {
            reasons.append(lateresons![i].customReasonName)
            temp = temp! - 1
            i = i + 1
        }
    }
    @IBAction func closeBTNtapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func checkboxClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        let point = sender.convert(CGPoint.zero, to: tableView)
        let indxPath = tableView.indexPathForRow(at: point)
        let indx = (indxPath?.row)!
        print(reasonsSend)
        print(indx)
        if selectedRows.contains(indxPath!) {
            
            if((indxPath!.row) != 0){
                let index = reasonsSend.firstIndex(of: lateresons![indxPath!.row].customReasonName)
                reasonsSend.remove(at: index!)
                
            }
            
            
            selectedRows.remove(at: selectedRows.firstIndex(of: indxPath!) ?? 0)
        } else {
            print(reasons[indx])
            reasonsSend.append(reasons[indx])
            selectedRows.append(indxPath!)
        }
        // tableView.reloadData()
        let indexPath = indxPath! as IndexPath
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    @IBAction func DoneBTNtapped(_ sender: Any) {
        delegate.sendreson(arr: reasonsSend)
        self.dismiss(animated: true, completion: nil)
        
    }
    
}

extension ResonForLateViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reasons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reasonsTableViewCell",for: indexPath as IndexPath) as? reasonsTableViewCell
        cell?.resonNameLBL.text = reasons[indexPath.row]
        selectedreason = reasons[indexPath.row]
        cell?.radioBTN.addTarget(self, action: #selector(checkboxClicked(_ :)), for: .touchUpInside)
        cell?.radioBTN.isSelected = false
        if selectedRows.contains(indexPath) {
            cell?.radioBTN.isSelected = true
        }
        return cell!
        
    }
    
    
}
