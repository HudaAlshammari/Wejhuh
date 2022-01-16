//
//  Trip.swift
//  Wejhuh
//
//  Created by Huda N S on 10/06/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth

class Trip: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    var myFavorite = [String]()
    var selectedDetails : EventDetails?
    var selectedData : EventDetails!
    var filterdata = [Event]()
    let db = Firestore.firestore()
    
    @IBOutlet weak var favotiteList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
    // MARK: - tableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFavorite.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripsCell", for: indexPath) as! FavoritesListCell
        cell.photo?.image = UIImage(named: myFavorite[indexPath.row])
        cell.name?.text = myFavorite[indexPath.row].localaized
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            myFavorite.remove(at: indexPath.row)
            favotiteList.deleteRows(at: [indexPath], with: .fade)
            
            db.collection("Users").document(Auth.auth().currentUser?.uid ?? "").updateData([
                "likes": myFavorite,
            ]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                 }
              }
           }
        }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    performSegue(withIdentifier: "toSeeMore" , sender: nil)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == Segues.toSeeMore.rawValue {
//            let dest = segue.destination as! SeeMore
//            dest.selectedData = selectedDetails
//        }
//    }
}
