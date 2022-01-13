//
//  MyTrip.swift
//  Wejhuh
//
//  Created by Huda N S on 12/05/1443 AH.
//

import UIKit
import CoreData
import FirebaseAuth

class MyTrip: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    
    // MARK: -CORE DATA
    var myFavoriteModel: [TripsList] = []

    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FavoriteModel")
        container.loadPersistentStores (completionHandler: { desc, error in
            if let readError = error {
                print(readError)
            }
        })
        return container
    }()
   
    
    // MARK: - CollectionsView of the favotiteList
    
    // Outlet of CollectionView
    @IBOutlet weak var favotiteList: UICollectionView!
    
    //Array
    var myFavorite = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Formats for CollectionView
        favotiteList.backgroundColor = UIColor.clear
        
    }

    
    // MARK: - functions
    
    //function to determine the number of rows of an array
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return myFavorite.count
    }
    
    
    //function to select the elements of an array
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tripsCell", for: indexPath) as! FavoriteListCell
        cell.photo?.image = UIImage(named: myFavorite[indexPath.row])
        cell.name?.text = myFavorite[indexPath.row]
       
        return cell
        
//        cell.deleteThisCell = { [weak self] in
//
//                /// your deletion code here
//                /// for example:
//
//                self?.myFavorite.remove(at: indexPath.item)
//
//                do {
//                    try self?.realm.write {
//                        self?.realm.delete(myFavorite[indexPath.item]) /// or whatever realm array you have
//                    }
//                    self?.favotiteList.performBatchUpdates({
//                        self?.favotiteList.deleteItems(at: [indexPath])
//                    }, completion: nil)
//                } catch {
//                    print("Error deleting project from realm: \(error)")
//                }
//            }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
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
    
    
    func deleteFavFromFireStore(favIndex: Int){
        myFavorite.remove(at: favIndex)
        UserApi.addLikes(uid: Auth.auth().currentUser?.uid ?? "", likes: myFavorite)
    }
    
//    override func setEditing(_ editing: Bool, animated: Bool){
//        super.setEditing(editing, animated: animated)
//
//        favotiteList.allowsMultipleSelection = editing
//            let indexPaths = favotiteList.indexPathsForVisibleItems
//            for indexPath in indexPaths {
//                let cell = favotiteList.cellForItem(at: indexPath) as! FavoriteListCell
//                cell.isInEditingMode = editing
//            }
//    }

    
    
    // MARK: -CORE DATA
    
     //function to fetch the saved data
    func fetchAllLists() {
        let context = persistentContainer.viewContext
        do {
            myFavoriteModel = try context.fetch(TripsList.fetchRequest())
        } catch {
            print(error)
        }
    }
    
//    func deleteFav(fav: TripsList) {
//        let context = persistentContainer.viewContext
//
//        do {
//        context.delete(fav)
//        try context.save()
//        } catch{
//            print(error)
//        }
//    }

}

//
//if let selectedCells = favotiteList.indexPathsForSelectedItems {
//
//
//     let items = selectedCells.map { $0.item }.sorted().reversed()
//
//     for item in items {
//         myFavorite.remove(at: item)
//
//     }
//
//    favotiteList.deleteItems(at: selectedCells)
//   }




