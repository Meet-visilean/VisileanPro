//
//  CollectionViewCell.swift
//  visileanPro
//
//  Created by Visilean Meet on 18/02/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell,UITableViewDelegate,UITableViewDataSource{
    let cellReuseIdentifier = "cell"
    var TitleOfTableview : String = " "
    @IBOutlet var tableView: UITableView!
    var text : String = ""
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return TitleOfTableview
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
 
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: cellReuseIdentifier)
            cell.textLabel?.text = text
        return cell
    }
    
}
