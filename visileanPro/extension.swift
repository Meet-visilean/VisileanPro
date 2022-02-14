//
//  extension.swift
//  visileanPro
//
//  Created by Visilean Meet on 03/02/22.
//

import Foundation
import UIKit

extension UIView {

    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity

        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
        func setCornerRadius(radius: CGFloat) {
            self.layer.cornerRadius = radius
        }
        
        func makeCornerRounded(cornerRadius: CGFloat, maskedCorners: CACornerMask){
            clipsToBounds = true
            layer.cornerRadius = cornerRadius
            layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
        }
  
}
extension UIViewController {
  func alert(message: String, title: String = "") {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}




// Write/Set Boolean in User Defaults

