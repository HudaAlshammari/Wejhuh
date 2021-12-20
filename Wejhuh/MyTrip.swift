//
//  MyTrip.swift
//  Wejhuh
//
//  Created by Huda N S on 12/05/1443 AH.
//

import UIKit
import CoreData

class MyTrip: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
   
    @IBOutlet weak var favotiteList: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favotiteList.backgroundColor = UIColor.clear
        // Do any additional setup after loading the view.
    }
    
    var myFavoriteModel: [TripsList] = []
    
    
    //CORE-DATA=========================
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FavoriteModel")
        
        container.loadPersistentStores (completionHandler: { desc, error in
            if let readError = error {
                print(readError)
            }
        })
        return container
    }()
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return myFavoriteModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tripsCell", for: indexPath) as! favoriteListCell
        
        cell.photo?.image = UIImage(named: myFavoriteModel[indexPath.row].photo ?? "")
        cell.name?.text = myFavoriteModel[indexPath.row].name
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.fetchAllLists()
        self.favotiteList.reloadData()
    }
    
    
    //Fetch for COREDATA=====================
    func fetchAllLists() {
        let context = persistentContainer.viewContext
        do {
            myFavoriteModel = try context.fetch(TripsList.fetchRequest())
        } catch {
            print(error)
        }
    }
}
