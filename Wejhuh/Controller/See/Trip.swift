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
    var filterdata = [Event]()
    var selectedDetails : EventDetails?
    var selectedData : EventDetails!
    let db = Firestore.firestore()
    
    @IBOutlet weak var favotiteList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favotiteList.layer.cornerRadius = 12
    }
    fileprivate func setEvents(myFavorite: [String]) {
        for item in myFavorite {
            self.filterdata.append(contentsOf: Event.setSee(needToGetSelectedEvent: true, key: item))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myFavorite.removeAll()
        self.filterdata.removeAll()
        self.favotiteList.reloadData()
        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
            DispatchQueue.main.async {
                self.myFavorite = user.trips ?? [""]
                self.setEvents(myFavorite: self.myFavorite)
                self.favotiteList.reloadData()
            }
        }
    }
    
    
    // MARK: - tableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripsCell", for: indexPath) as! FavoritesListCell
        cell.photo?.image = UIImage(named: filterdata[indexPath.row].photo)
        cell.name?.text = filterdata[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            myFavorite.remove(at: indexPath.row)
            filterdata.remove(at: indexPath.row)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let events = filterdata[indexPath.row]
        selectedDetails = EventDetails(photo: events.photo2, name: events.name, from: events.from, to: events.to, starting: events.starting, ending: events.ending, season: events.season , audince: events.audince, overview: events.eventDetalis , latitude: events.latitude , longitude: events.longitude)
        performSegue(withIdentifier: "toSeeMore" , sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.toSeeMore.rawValue {
            let dest = segue.destination as! SeeMore
            dest.selectedData = selectedDetails
        }
    }
}
