//
//  GLB.swift
//  visileanPro
//
//  Created by Visilean Meet on 07/03/22.
//

import Foundation
import UIKit
class selectedTaskDetail {
    
    static let instance = selectedTaskDetail()
    
    private init() {
        }
        
    var selectedTask : String = ""
}

//  case NotCommitted = 0 //     color =#EAEC60
//    case NotReady = 1      color =  #D66657
//    case Ready = 2         color = #59EEB6
//    case ForceReady = 3    color =#afd027
//    case Started = 4       color =  #541c60
//    case Warning = 5       color = #f6bf40
//    case Stopped = 6        color = #e40001
//    case Complete = 7          color =#089331
//    case Rejected = 8          color = #5a54b4
//    case QualityChecked = 9        color =#014009



func StatusToTaskstatusName(Status : Int) ->( String,UIColor){
    
    switch (Status)  {
    case 0:
        let color1 = hexStringToUIColor(hex: "#EAEC60")
        return ("NotCommitted",color1)
        
    case 1:
        let color1 = hexStringToUIColor(hex: "#D66657")
        return ("makeReady",color1)
    case 2:
        let color1 = hexStringToUIColor(hex: "#59EEB6")
        return ("Ready",color1)
    case 3:
        let color1 = hexStringToUIColor(hex: "#afd027")
        return ("ForceReady",color1)
    case 4:
        let color1 = hexStringToUIColor(hex: "#541c60")
        return ("Started",color1)
    case 5:
        let color1 = hexStringToUIColor(hex: "#f6bf40")
        return ("Warning",color1)
    case 6:
        let color1 = hexStringToUIColor(hex: "#e40001")
        return ("Stopped",color1)
    case 7:
        let color1 = hexStringToUIColor(hex: "#5a54b4")
        return ("Complete",color1)
    case 8:
        let color1 = hexStringToUIColor(hex: "#afd027")
        return ("Rejected",color1)
    case 9:
        let color1 = hexStringToUIColor(hex: "##014009")
        return ("QA",color1)
    default:
        break
    }
    let color1 = hexStringToUIColor(hex: "#EAEC60")
    return ("",color1)
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
