//
//  SeeVC.swift
//  Wejhuh
//
//  Created by Huda N S on 08/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class SeeVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource  {
    
    
    //Variable to fill in details
    var selectedSee : Event?
    var selectedDetails : EventDetails?
    var curentImageName: String?
    
    // searchBar
    var filterdata = [Event]()
    var searching = false
    
    // Favorites
    var myFavorite = [String]()
    var favorite = [Event]()
    
    // MARK: - CollectionView of the See
    
    //Outlet of CollectionView
    @IBOutlet weak var seeCollectionView: UICollectionView!
    @IBOutlet weak var search: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seeCollectionView.delegate = self
        seeCollectionView.dataSource = self
        seeCollectionView.backgroundColor = UIColor.clear
        filterdata = favorite
        search.delegate = self
        favorite = Event.setSee(needToGetSelectedEvent: false, key: nil)
        filterdata = favorite
        
        // To access with information about the user
        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
            DispatchQueue.main.async {
                self.myFavorite = user.trips ?? [""]
                print("favs")
                print(self.myFavorite)
            }
        }
    }
    
    
    // MARK: - collectionView methods
    
    //function to determine the number of rows of an array
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return filterdata.count
    }
    
    //function to select the elements of an array
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SeeCell
        let data = filterdata[indexPath.row]
        cell.setupCell(photo: data.photo, city : data.city , name: data.name)
        cell.curentImageName = data.photo
        cell.seeCity?.text = filterdata[indexPath.row].city
        return cell
    }
    
    //function that is didSelect on the cells
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let events = filterdata[indexPath.row]
        selectedDetails = EventDetails(photo: events.photo2, name: events.name, from: events.from, to: events.to, starting: events.starting, ending: events.ending, season: events.season , audince: events.audince, overview: events.eventDetalis , latitude: events.latitude , longitude: events.longitude)
        performSegue(withIdentifier: Segues.toSeeMore.rawValue , sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.toSeeMore.rawValue {
            let dest = segue.destination as! SeeMore
            dest.selectedData = selectedDetails
        }
    }
}


// MARK: - extension for Search
extension SeeVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        filterdata = searchText.isEmpty ? favorite : favorite.filter {(item : Event) -> Bool in
            return item.city.contains(searchText)
        }
        searching = true
        seeCollectionView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        filterdata = favorite
        seeCollectionView.reloadData()
    }
}

