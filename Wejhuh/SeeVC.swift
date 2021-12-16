//
//  SeeVC.swift
//  Wejhuh
//
//  Created by Huda N S on 08/05/1443 AH.
//

import UIKit
import CoreData

class SeeVC: UIViewController {
    

    let persistentContainer : NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "FavoriteModel")
        container.loadPersistentStores(completionHandler: { desc, error in
            if let readError = error {
                print(readError)
            }
        })
        return container
    }()
    
    
    @IBOutlet weak var seeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        seeCollectionView.delegate = self
        seeCollectionView.dataSource = self
        seeCollectionView.backgroundColor = UIColor.clear
        setSee()
    }
    
    var favorite = [Event]()
    var selectedSee : Event?
    
    func setSee(){
        favorite.append(Event(name: "Sea Experiences", city: "Jeddah", photo : "see1"))
        favorite.append(Event(name: "Formula", city: "Jeddah", photo :  "see2"))
        favorite.append(Event(name: "Athra", city: "Khobar", photo :  "see3"))
        favorite.append(Event(name: "Dakar Rally", city: "Around the country" , photo :"see4"))
        favorite.append(Event(name: "Safari", city: "Riyadh", photo :  "see5"))
        favorite.append(Event(name: "Khobar Corniche", city: "Khobar", photo :  "see6"))
        favorite.append(Event(name: "Combat Filed", city: "Riyadh", photo : "see7"))
        favorite.append(Event(name: "Dakakin", city: "Riyadh", photo :  "see8"))
    }
}


struct Event {
    let name : String
    let city : String
    let photo : String
}
