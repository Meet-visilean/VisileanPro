//
//  CollectionViewCell.swift
//  visileanPro
//
//  Created by Visilean Meet on 18/02/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell,UITableViewDelegate,UITableViewDataSource{
    var TaskList : [TaskListResult]? = nil
    let cellReuseIdentifier = "cell"
    var TitleOfTableview : String = " "
   // var task
    @IBOutlet var tableView: UITableView!
    var name : String = "nam"
    var projecguid = "guid"
    var startdate : String = "date"
    var statusoftask : String = "Stausoftask"
    var color : UIColor?
    var text : String = ""
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return TitleOfTableview
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        print(indexPath.row)
        print(projecguid)
            selectedTaskDetail.instance.selectedTask = projecguid
            
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! tableTableViewCell

        cell.NameLBL.text = name
        cell.startDataLBL.text = startdate
    
        
        color = .red
        startdate = ""
        name = ""

        return cell
    }

}
