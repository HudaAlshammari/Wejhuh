//
//  Trip.swift
//  Wejhuh
//
//  Created by Huda N S on 10/06/1443 AH.
//

import UIKit
import CoreData
import FirebaseFirestore
import FirebaseAuth

class Trip: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    var db : Firestore!
    var myFavoriteModel: [TripsList] = []
    var myFavorite = [String]()
    
    // MARK: -CORE DATA
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FavoriteModel")
        container.loadPersistentStores (completionHandler: { desc, error in
            if let readError = error {
                print(readError)
            }
        })
        return container
    }()
    
    
    @IBOutlet weak var favotiteList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        favotiteList.backgroundColor = UIColor.clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.fetchAllLists()
        self.favotiteList.reloadData()
        
        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
            DispatchQueue.main.async {
                self.myFavorite = user.trips ?? [""]
                self.favotiteList.reloadData()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFavorite.count
    }
    
    // MARK: - tableView methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripsCell", for: indexPath) as! FavoritesListCell
        cell.photo?.image = UIImage(named: myFavorite[indexPath.row])
        cell.name?.text = myFavorite[indexPath.row]
       
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let trip = myFavorite[indexPath.row]
            myFavorite.remove(at: indexPath.row)
            favotiteList.deleteRows(at: [indexPath], with: .automatic)

            db.collection("Users").document("uid").updateData([
                "likes": myFavorite.remove(at: indexPath.row),
            ]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
        }
    }
    
    // MARK: -CORE DATA
    func fetchAllLists() {
        let context = persistentContainer.viewContext
        do {
            myFavoriteModel = try context.fetch(TripsList.fetchRequest())
        } catch {
            print(error)
        }
    }
}



//    func deleteFavFromFireStore(favIndex: Int){
//        myFavorite.remove(at: favIndex)
//        UserApi.addLikes(uid: Auth.auth().currentUser?.uid ?? "", likes: myFavorite)
//    }
