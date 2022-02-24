//
//  ViewController.swift
//  visileanPro
//
//  Created by Visilean Meet on 15/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ViewCustom: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewCustom.transform = ViewCustom.transform.rotated(by: CGFloat(Double.pi / -30))
    }
  

}
