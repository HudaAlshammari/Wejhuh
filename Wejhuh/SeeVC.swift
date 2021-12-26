//
//  SeeVC.swift
//  Wejhuh
//
//  Created by Huda N S on 08/05/1443 AH.
//

import UIKit
import CoreData

class SeeVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource  {
    

    var myFavoriteModel: [TripsList] = []

    
    //SAVE CORE DATA=================
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
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorite.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        selectedSee = favorite[indexPath.row]
        performSegue(withIdentifier: Segues.toSeeMore.rawValue , sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SeeCell
        let data = favorite[indexPath.row]
        cell.setupCell(photo: data.photo, city : data.city , name: data.name)
        cell.curentImageName = data.photo
        cell.btnAddToMyTrip.tag = indexPath.row
        cell.btnAddToMyTrip.addTarget(self, action: #selector(addToMyTrip(sender:)), for: .touchUpInside )
        return cell
    }
    
    
    @objc
    func addToMyTrip(sender : UIButton){
        print("")
        let currentImage = sender.imageView?.image
        
        if currentImage == UIImage(systemName: "heart.circle.fill"){
            sender.setImage(UIImage(systemName: "heart.circle"), for: .normal)
        }else{
            sender.setImage(UIImage(systemName: "heart.circle.fill"), for: .normal)
        }
    }
    
    
    
    
    //CORE-DATA
    func createNewList(eventName: String, eventPhoto: String){
        let context = persistentContainer.viewContext
        context.performAndWait {
            let list = TripsList(context: context)
            list.name = eventName
            list.photo = eventPhoto
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
    
//    func storeFavorite(){
//    }
}



struct Event {
    let name : String
    let city : String
    let photo : String
}


