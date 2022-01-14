//
//  Trip.swift
//  Wejhuh
//
//  Created by Huda N S on 10/06/1443 AH.
//

import UIKit
//import CoreData
import Firebase
import FirebaseAuth

class Trip: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
//    var myFavoriteModel: [TripsList] = []
    var myFavorite = [String]()

    
    @IBOutlet weak var favotiteList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        favotiteList.backgroundColor = UIColor.clear
        favotiteList.layer.cornerRadius = 12
    }
    
    override func viewWillAppear(_ animated: Bool) {

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
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            favotiteList.beginUpdates()
            myFavorite.remove(at: indexPath.row)
            
            favotiteList.deleteRows(at: [indexPath], with: .fade)
            favotiteList.endUpdates()
        }
    }
    
    
    
}
