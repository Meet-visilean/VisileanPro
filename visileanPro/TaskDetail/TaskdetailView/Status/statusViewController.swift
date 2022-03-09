//
//  statusViewController.swift
//  visileanPro
//
//  Created by Visilean Meet on 08/03/22.
//

import UIKit

class statusViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 25
        mainView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner,.layerMinXMinYCorner)
        mainView.addShadow(offset: CGSize.init(width: 3, height: 3), color: UIColor.black, radius: 5.0, opacity: 0.35)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func CloseBTNtapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
 

}
