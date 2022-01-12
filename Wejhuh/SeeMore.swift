//
//  SeeMore.swift
//  Wejhuh
//
//  Created by Huda N S on 15/05/1443 AH.
//
import Foundation
import UIKit
import CoreData
import MapKit
import FirebaseAuth
import FirebaseFirestore

class SeeMore: UIViewController {

    
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
    
    
    
    var selectedData : EventDetails!
    
    var myFavorite = [String]()
    
    //Outlet of items of CollectionView
    @IBOutlet weak var seeImge: UIImageView!
    @IBOutlet weak var seeName: UILabel!
    
    
    
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var to: UILabel!
    
    
    @IBOutlet weak var ending: UILabel!
    @IBOutlet weak var starting: UILabel!
    
    
    @IBOutlet weak var audience: UILabel!
    @IBOutlet weak var season: UILabel!
    
    
    @IBOutlet weak var overview: UILabel!
    
    
    @IBOutlet weak var location: MKMapView!
    
    
    
    
//    var selectedArrayTrips : Trips!
//    var arrayTrip = [Trips]()
    var curentImageName: String?
    
    var lat = ""
    var lon = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Formats for cell
        seeImge.layer.cornerRadius = 35
        
        seeImge.image = UIImage(named: selectedData.photo)
        seeName.text = selectedData.name
        from.text = selectedData.from
        to.text = selectedData.to
        starting.text = selectedData.starting
        ending.text = selectedData.ending
        season.text = selectedData.season
        audience.text = selectedData.audince
        overview.text = selectedData.overview
        
        lat = selectedData.latitude
        lon = selectedData.longitude
        
    }
    
    
    @IBAction func addToFavorite(_ sender: Any) {
        
        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
            DispatchQueue.main.async {

                self.myFavorite =  user.trips ?? [""]
                let fav = self.seeName.text ?? ""
                if let foundIndex = self.myFavorite.firstIndex(of: fav) {
                    print("Already added \(foundIndex)")
                    
                    
                    let alart = UIAlertController(title: "", message: "Already added", preferredStyle: UIAlertController.Style.alert)
                    alart.addAction(UIAlertAction(title: "ok", style: .default , handler: nil))
                    self.present(alart, animated: true)
                    
                    
                } else {
                    self.myFavorite.append(fav)
                    UserApi.addLikes(uid: Auth.auth().currentUser?.uid ?? "", likes: self.myFavorite)
                    print("favs")
                    print(self.myFavorite)
                    let alart = UIAlertController(title: "", message: "It was successfully added to My Trip", preferredStyle: UIAlertController.Style.alert)
                    alart.addAction(UIAlertAction(title: "ok", style: .default , handler: nil))
                    self.present(alart, animated: true)
                }
            }
        }
    }
    
//    func fetchAllLists() -> [TripsList] {
//        let context = persistentContainer.viewContext
//        var trip : [TripsList] = []
//        do {
//            trip = try context.fetch(TripsList.fetchRequest())
//        } catch {
//            print(error)
//        }
//        return trip
//    }
    
//    static func addLikes(uid:String,likes:[String]) {
//        let refUsers = Firestore.firestore().collection("Users")
//        refUsers.document(uid).setData(["likes":likes],merge: true)
//    }
    
}






                    


//                    let alarts = UIAlertController(title: "", message: "ok", preferredStyle: .actionSheet)
//                    alarts.addAction(UIAlertAction(title: "ok", style: .default , handler: nil))
//                    alarts.present(alarts, animated: true)
                    
