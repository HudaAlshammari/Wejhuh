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
        setSee()
    }
    
    var see = [See]()
    var selectedSee : See?
    
    func setSee(){
        see.append(See(name: "Sea Experiences", city: "Jeddah", photo : UIImage(named: "see1")!))
        see.append(See(name: "Formula", city: "Jeddah", photo : UIImage(named: "see2")!))
        see.append(See(name: "Athra", city: "Khobar", photo : UIImage(named: "see3")!))
        see.append(See(name: "Dakar Rally", city: "Hail" , photo : UIImage(named: "see4")!))
        see.append(See(name: "Safari", city: "Riyadh", photo : UIImage(named: "see5")!))
        see.append(See(name: "Khobar Corniche", city: "Khobar", photo : UIImage(named: "see6")!))
        see.append(See(name: "Combat Filed", city: "Riyadh", photo : UIImage(named: "see7")!))
        see.append(See(name: "Dakakin", city: "Riyadh", photo : UIImage(named: "see8")!))
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return see.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SeeCell
        let data = see[indexPath.row]
        cell.setupCell(photo: data.photo, city : data.city , name: data.name)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        selectedSee = see[indexPath.row]
        performSegue(withIdentifier: "seeDetail", sender: nil)
    }
}

struct See {
    let name : String
    let city : String
    let photo : UIImage
}
