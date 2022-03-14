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
    var reasons : [String] = ["Predecessor","space","Equipment","Material","Design","External","Manpower"]
    var reasonsSend : [String] = []
    var delegate : resonforlateonstartBTN!
    var selectedreason : String = ""
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
            mainView.layer.cornerRadius = 25
        mainView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner,.layerMinXMinYCorner)
        mainView.addShadow(offset: CGSize.init(width: 3, height: 3), color: UIColor.black, radius: 5.0, opacity: 0.35)
        closeBTN.layer.cornerRadius = 15
        closeBTN.addShadow(offset: CGSize.init(width: 2, height: 3), color: UIColor.black, radius: 3, opacity: 0.35)
        submitBTN.layer.cornerRadius = 15
        submitBTN.addShadow(offset: CGSize.init(width: 2, height: 3), color: UIColor.black, radius: 3, opacity: 0.35)
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
            if(indxPath?.row == 0){
                let index = reasonsSend.firstIndex(of: "Predecessor")
                reasonsSend.remove(at: index!)
            }
            else if(indxPath?.row == 1){
                let index = reasonsSend.firstIndex(of: "space")
                reasonsSend.remove(at: index!)
            }
            else if(indxPath?.row == 2){
                let index = reasonsSend.firstIndex(of: "Equipment")
                reasonsSend.remove(at: index!)
            }
            else if(indxPath?.row == 3){
                let index = reasonsSend.firstIndex(of: "Material")
                reasonsSend.remove(at: index!)
            }
            else if(indxPath?.row == 4){
                let index = reasonsSend.firstIndex(of: "Design")
                reasonsSend.remove(at: index!)
            }
            else if(indxPath?.row == 5){
                let index = reasonsSend.firstIndex(of: "External")
                reasonsSend.remove(at: index!)
            }
            else if(indxPath?.row == 6){
                let index = reasonsSend.firstIndex(of: "Manpower")
                reasonsSend.remove(at: index!)
            }

            selectedRows.remove(at: selectedRows.firstIndex(of: indxPath!) ?? 0)
            } else {
                print(reasons[indx])
               reasonsSend.append(reasons[indx])
                selectedRows.append(indxPath!)
           }
       // tableView.reloadData()
        var indexPath = indxPath! as IndexPath
        tableView.reloadRows(at: [indexPath], with: .automatic)
        }
 
    @IBAction func DoneBTNtapped(_ sender: Any) {
        delegate.sendreson(arr: reasonsSend)
      print(selectedRows)
        print(reasonsSend)
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
