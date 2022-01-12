//
//  SeeCell.swift
//  Wejhuh
//
//  Created by Huda N S on 08/05/1443 AH.
//

import UIKit
import CoreData
import FirebaseAuth
import FirebaseFirestore


class SeeCell: UICollectionViewCell {
    
    // MARK: -CORE DATA
    
    var selectedArrayTrips : Trips!
    var selectedSee : Event!
    
    var arrayTrip = [Trips]()
    let persistentContainer : NSPersistentContainer = {
       let container = NSPersistentContainer(name: "FavoriteModel")
       container.loadPersistentStores(completionHandler: { desc, error in
           if let readError = error {
               print(readError)
           }
       })
       return container
   }()
    
    var curentImageName: String?
    var myFavorite = [String]()
    
    // MARK: - Cell
    
    // Outlet of items in cells
    @IBOutlet weak var seeView: UIView!
    @IBOutlet weak var seeCity: UILabel!
    @IBOutlet weak var seeName: UILabel!
    @IBOutlet weak var btnAddToMyTrip: UIButton!
    @IBOutlet weak var seeImage: UIImageView!


    override func awakeFromNib() {
        //Formats for cell
        seeImage.layer.cornerRadius = 12
        seeView.layer.cornerRadius = 12
    }
    
    //Function to setup items in cells
    func setupCell(photo : String ,city : String , name : String){
        seeImage.image = UIImage(named:photo)
        seeName.text = name
        seeCity.text = city
}
    
    // MARK: - button
    
    // button for add to list of trips
    @IBAction func addFavoritePlaces(_ sender: UIButton) {

//        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
//            DispatchQueue.main.async {
//
//                self.myFavorite =  user.trips ?? [""]
//                let fav = self.seeName.text ?? ""
//                if let foundIndex = self.myFavorite.firstIndex(of: fav) {
//                    
//                    let alart = UIAlertController(title: "", message: "Already added", preferredStyle: UIAlertController.Style.alert)
//                    alart.addAction(UIAlertAction(title: "", style: .default , handler: nil))
//                    alart.present(alart, animated: true)
//                    
//                    print("Already added \(foundIndex)")
//                    print("added")
//                    
//                    
//                } else {
//                    self.myFavorite.append(fav)
//                    UserApi.addLikes(uid: Auth.auth().currentUser?.uid ?? "", likes: self.myFavorite)
////                    print("favs")
////                    print(self.myFavorite)
//                    
//                    
//                    let alarts = UIAlertController(title: "", message: "ok", preferredStyle: .actionSheet)
//                    alarts.addAction(UIAlertAction(title: "ok", style: .default , handler: nil))
//                    alarts.present(alarts, animated: true)
//                    
//                }
//                
//                
//            }
//            
//        }
        
        
//        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
//            DispatchQueue.main.async {
//                self.myFavorite =  user.trips ?? [""]
//                self.myFavorite.append(self.seeName.text ?? "")
//                UserApi.addLikes(uid: Auth.auth().currentUser?.uid ?? "", likes: self.myFavorite)
//                print("favs")
//                print(self.myFavorite)
//            }
//        }
    }
    
    
    // MARK: -CORE DATA

    //to save data
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
    
    
    
    // MARK: -CORE DATA
    
    // function to
    func fetchAllLists() -> [TripsList] {
        let context = persistentContainer.viewContext
        var trip : [TripsList] = []
        do {
            trip = try context.fetch(TripsList.fetchRequest())
        } catch {
            print(error)
        }
        return trip
    }
}





//fetch the saved data
