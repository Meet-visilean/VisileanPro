//
//  LeaderBoard.swift
//  visileanPro
//
//  Created by Visilean Meet on 17/03/22.
//

import UIKit
import SideMenu

class LeaderBoard: UIViewController {
    
    @IBOutlet var SuperView: UIView!
    @IBOutlet var TotalTaskLBL: UILabel!
    @IBOutlet var mainView: UIView!
    private let alltaskmanager = LeaderBoardMAnager()
    var LeaderboardVm = LeaderBoardVM()
    @IBOutlet var navBar: UINavigationBar!
    var colData : [String] = ["AllTime","Week","Month"]
    var nameArray : [String] = [""]
    var Score : [String] = [""]
    var indx : [String] = ["1","2","3","4","5","6","7","8","9","10"]
    @IBOutlet var tableView: UITableView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var image3: UIImageView!
    @IBOutlet var firstnoView: UIView!
    @IBOutlet var secondnoView: UIView!
    @IBOutlet var upperView: UIView!
    var dictofactor : [String : String] = [:]
    var SelectedIndex = 0
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image1: UIView!
    @IBOutlet var thirdnoView: UIView!
    var ResultDict : [String : Int]?
    var arrayOfactor : [String] = []
    var nameactor : [String] = []
    var enddate  = Date().millisecondsSince1970
    
    //1
    
    @IBOutlet var Lead1Name: UILabel!
    @IBOutlet var Lead1Score: UILabel!
    //2
    @IBOutlet var Lead2name: UILabel!
    @IBOutlet var lead2Score: UILabel!
    
    //3
    @IBOutlet var lead3Name: UILabel!
    @IBOutlet var lead3Score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar(navBar: navBar)
        mainView.layer.cornerRadius = 40
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        mainView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner)
        mainView.addShadow(offset: CGSize.init(width: 0, height: 2), color: UIColor.black, radius: 3, opacity: 0.45)
        
        
        
        secondnoView.layer.cornerRadius = 10
        
        secondnoView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner,.layerMinXMinYCorner)
  
        image1.addShadow(offset: CGSize.init(width: 0, height: 2), color: UIColor.black, radius: 3, opacity: 0.45)
        image3.addShadow(offset: CGSize.init(width: 0, height: 2), color: UIColor.black, radius: 3, opacity: 0.45)
        image2.addShadow(offset: CGSize.init(width: 0, height: 2), color: UIColor.black, radius: 3, opacity: 0.45)
        thirdnoView.layer.cornerRadius = 10
        
        thirdnoView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner,.layerMinXMinYCorner)
     
        firstnoView.layer.cornerRadius = 10
        
        firstnoView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner,.layerMinXMinYCorner)
      
        SuperView.backgroundColor = upperView.backgroundColor
        
        
     
        
        //find all actorguid List and store in array
        arrayOfactor = LeaderboardVm.findallactorList().0
        dictofactor = LeaderboardVm.findallactorList().1
        nameactor = LeaderboardVm.findallactorList().2
        print(arrayOfactor)
       // print(dictofactor)
        print(nameactor)
        
        //guid and date wise search from coreDB
      
        
       allTimeWinnnerData()
        
    }
    
    @IBAction func btnClickMenu(_ sender: Any) {
        let menu = SideMenuNavigationController(rootViewController: SideMenu())
        menu.leftSide=true
        present(menu, animated: true, completion: nil)
    }
    func filldata(name:[String],Score:[String])
    {
         
        Lead1Name.text = dictofactor[name[0]]
        Lead2name.text = dictofactor[name[1]]
        lead3Name.text = dictofactor[name[2]]
        Lead1Score.text = Score[0]
        lead2Score.text = Score[1]
        lead3Score.text = Score[2]
    }
    // var enddate  = Date().millisecondsSince1970
   func WeeklyWinnerData()
    {
        //604800000
        let startdate = (Int(enddate)-604800000)
        ResultDict=LeaderboardVm.guidbydataofCompletedtask(startdate:startdate ,enddate:Int(enddate) , arrayOfactor:arrayOfactor)
        var arr : [String] = []
        var arrname : [String]=[]
        nameArray = []
        Score = []
      
        let sortedOne = ResultDict!.sorted { (first, second) -> Bool in
            return first.value > second.value
        }
        for (key, value) in sortedOne {
            let x = String(value)
            arr.append(x)
            arrname.append(key)
        }
        
        print(arr)
        print(arrname)
        
        nameArray = arrname
        Score = arr
       
        filldata(name:nameArray,Score:Score)
    }
 
    func allTimeWinnnerData()
    {
        
        ResultDict=LeaderboardVm.guidbydataofCompletedtask(startdate:0 ,enddate:Int(enddate) , arrayOfactor:arrayOfactor)
        var arr : [String] = []
        var arrname : [String]=[]
        nameArray = []
        Score = []
      
        let sortedOne = ResultDict!.sorted { (first, second) -> Bool in
            return first.value > second.value
        }
        for (key, value) in sortedOne {
            let x = String(value)
            arr.append(x)
            arrname.append(key)
        }
        print(arr)
        print(arrname)
        nameArray = arrname
        Score = arr
        filldata(name:nameArray,Score:Score)
        
    }
    func monthlyWinner()
    {
      
        let startdate = (Int(enddate)-2592000000)
        ResultDict=LeaderboardVm.guidbydataofCompletedtask(startdate:startdate ,enddate:Int(enddate) , arrayOfactor:arrayOfactor)
            var arr : [String] = []
            var arrname : [String]=[]
            nameArray = []
            Score = []
          
            let sortedOne = ResultDict!.sorted { (first, second) -> Bool in
                return first.value > second.value
            }
            for (key, value) in sortedOne {
                let x = String(value)
                arr.append(x)
                arrname.append(key)
            }
            print(arr)
            print(arrname)
            nameArray = arrname
            Score = arr
        filldata(name:nameArray,Score:Score)
    }
    
}
@IBDesignable
class upperView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let y = bounds.size.height - 80.0
        
        let p1 = CGPoint(x: 0.0, y: y)
        let p2 = CGPoint(x: bounds.size.width, y: y)
        
        let cp1 = CGPoint(x: p1.x, y: bounds.size.height)
        let cp2 = CGPoint(x: bounds.size.width, y: bounds.size.height)
        
        let myBez = UIBezierPath()
        
        myBez.move(to: CGPoint(x: 0.0, y: y))
        
        myBez.addCurve(to: p2, controlPoint1: cp1, controlPoint2: cp2)
        
        myBez.addLine(to: CGPoint(x: bounds.size.width, y: 0.0))
        myBez.addLine(to: CGPoint.zero)
        
        myBez.close()
        
        let l = CAShapeLayer()
        l.path = myBez.cgPath
        layer.mask = l
        
    }
}

extension LeaderBoard : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeaderboardCollectionViewCell", for: indexPath) as! LeaderboardCollectionViewCell
        cell.NameCollLBL.text = colData[indexPath.row]
        if SelectedIndex == indexPath.row
        {
            cell.NameCollLBL.textColor = .black
            cell.sepratorView.backgroundColor = .red
        }
        else
        {
            cell.NameCollLBL.textColor = .systemGray2
            cell.sepratorView.backgroundColor = .systemGray2
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeaderboardCollectionViewCell", for: indexPath) as! LeaderboardCollectionViewCell
     
        if(indexPath.row == 0)
        {
            cell.NameCollLBL.textColor = .red
            cell.sepratorView.backgroundColor = .red
            SelectedIndex = indexPath.row
            allTimeWinnnerData()
            collectionView.reloadData()
            tableView.reloadData()
        }
        else if(indexPath.row == 1)
        {
            SelectedIndex = indexPath.row
            WeeklyWinnerData()
            collectionView.reloadData()
            tableView.reloadData()
        }
        else if(indexPath.row == 2)
        {
            SelectedIndex = indexPath.row
            monthlyWinner()
            collectionView.reloadData()
            tableView.reloadData()
        }
        
    }
    
    
}
extension LeaderBoard : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(nameArray.count < 10 )
        {
            return nameArray.count
        }
        else{
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderboardTableViewCell") as! LeaderboardTableViewCell
        cell.count.text = indx[indexPath.row]
    
        var name = dictofactor[nameArray[indexPath.row]]
        if(name == "")
        {
            name = "Test"
        }
        cell.NameLBL.text = name
        cell.ScoreLBL.text = Score[indexPath.row]
   
        return cell
    }
    
    
    
}
