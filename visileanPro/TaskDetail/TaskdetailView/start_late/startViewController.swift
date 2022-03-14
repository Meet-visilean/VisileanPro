//
//  startViewController.swift
//  visileanPro
//
//  Created by Visilean Meet on 09/03/22.
//

import UIKit

class startViewController: UIViewController {
    
    var resonforlateOBJ = ResonForLateViewController()
    
    @IBOutlet var submitBTN: UIButton!
    @IBOutlet var closeBTN: UIButton!
    @IBOutlet var mainView: UIView!
    @IBOutlet var coleView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    private var selected = [String]()
    private var titles = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        mainView.layer.cornerRadius = 25
        mainView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner,.layerMinXMinYCorner)
        mainView.addShadow(offset: CGSize.init(width: 3, height: 3), color: UIColor.black, radius: 5.0, opacity: 0.35)
        
        submitBTN.layer.cornerRadius = 15
    
        submitBTN.addShadow(offset: CGSize.init(width: 2, height: 3), color: UIColor.black, radius: 3, opacity: 0.35)
        
        closeBTN.layer.cornerRadius = 15
     
        closeBTN.addShadow(offset: CGSize.init(width: 2, height: 3), color: UIColor.black, radius: 3, opacity: 0.35)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func resonforlateBTNtapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResonForLateViewController") as! ResonForLateViewController
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func closeBTNtapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension startViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            guard let cell = collectionView.cellForItem(at: indexPath) as? reasonlatestartCollectionViewCell, let text = cell.tagLabel.text else {return}
    
            if selected.contains(text) {
                selected = selected.filter{$0 != text}
            } else {
                selected.append(text)
            }
            collectionView.reloadData()
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 200, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reasonlatestartCollectionViewCell",for: indexPath) as? reasonlatestartCollectionViewCell else {  return reasonlatestartCollectionViewCell() }
        cell.tagLabel.text = titles[indexPath.row]
        cell.deleteBTN.row = indexPath.row
        print( cell.deleteBTN.row)
    
        cell.deleteBTN.addTarget(self, action:#selector(deleteTapped(_:)), for: .touchUpInside)
        return cell
      
    }
    
}

extension startViewController {
    @objc func deleteTapped(_ sender: customBTN) {
        let indexPath = IndexPath(row: sender.row, section:0)
        guard let cell = collectionView.cellForItem(at: indexPath) as? reasonlatestartCollectionViewCell,
              let text = cell.tagLabel.text else {return}
        selected = selected.filter{$0 != text}
        titles.remove(at: indexPath.row)
        collectionView.reloadData()
    }
}
extension startViewController : resonforlateonstartBTN{
    func sendreson(arr: [String]) {
        titles = arr
        collectionView.reloadData()
    }
    
    
}
