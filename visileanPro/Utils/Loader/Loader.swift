//
//  Loader.swift
//  visileanPro
//
//  Created by Visilean Meet on 09/03/22.
//

import UIKit

class Loader: UIViewController {

    @IBOutlet var gifimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let loader = UIImage.gifImageWithName("loader")
        gifimage.image = loader

        // Do any additional setup after loading the view.
    }
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
