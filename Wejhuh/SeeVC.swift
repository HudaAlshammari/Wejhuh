//
//  SeeVC.swift
//  Wejhuh
//
//  Created by Huda N S on 08/05/1443 AH.
//

import UIKit

class SeeVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource{
   
    

    @IBOutlet weak var seeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        seeCollectionView.delegate = self
        seeCollectionView.dataSource = self
        seeCollectionView.backgroundColor = UIColor.clear
    }
    
    
    let SeeImages = ["see1" , "see2" , "see3" , "see4" , "see5" , "see6" , "see7" , "see8"]
    
    
    let SeeCity = ["Sea Experiences" , "Formula" , "Athra" , "Dakar Rally" , "Safari" , "Khobar Corniche" , "Combat Filed" , "Dakakin"]
    
    
    let SeeNames = ["Jeddah" , "Jeddah" , "Khobar" , "Hail" , "Riyadh" , "Khobar" , "Riyadh" , "Riyadh"]

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SeeImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SeeCell
        cell.seeImage.image = UIImage(named: SeeImages[indexPath.row])
        cell.seeName.text = SeeNames[indexPath.row]
        cell.seeDic.text = SeeCity[indexPath.row]
        
        return cell
    }
}
