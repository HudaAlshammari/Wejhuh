//
//  SeeVC.swift
//  Wejhuh
//
//  Created by Huda N S on 08/05/1443 AH.
//

import UIKit
import CoreData
import Firebase
import FirebaseFirestore

class SeeVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource  {
    
    
    // MARK: -CORE DATA
    
    var myFavoriteModel: [TripsList] = []
    
    
    var selectedDetails : EventDetails?
    //SAVE CORE DATA
    let persistentContainer : NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FavoriteModel")
        container.loadPersistentStores(completionHandler: { desc, error in
            if let readError = error {
                print(readError)
            }
        })
        return container
    }()
    
    
    // MARK: - CollectionView of the See
    
    //Outlet of CollectionView
    @IBOutlet weak var seeCollectionView: UICollectionView!
    
    //Variable to fill in details
//    var selectedSee : Event?
    
    //Variable to
    var myFavorite = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seeCollectionView.delegate = self
        seeCollectionView.dataSource = self
        seeCollectionView.backgroundColor = UIColor.clear
        setSee()
        
        // To access with information about the user
        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
            DispatchQueue.main.async {
                self.myFavorite = user.trips ?? [""]
                print("favs")
                print(self.myFavorite)
            }
        }
    }
    
    
    // MARK: - Array
    
    //Array of pictures, names and details
    var favorite = [Event]()
    
    
    // Fill in the array with data
    func setSee(){
        favorite.append(Event(name: "Sea Experiences",
                              city: "Jeddah",
                              photo : "Sea Experiences",
                              photo2: "Riyadh3" ,
                              from: "4:00 PM",
                              to: "12:00AM",
                              starting: "3 OCT 2021",
                              ending: "11 JAN 2021 ",
                              season: "All Season",
                              audince: "All",
                              eventDetalis: "This development phase is the largest development phase of the Jeddah waterfront, and there are services and elements that have been added for the first time at the level of Jeddah waterfronts, equipped with services suitable for all groups and ages .. "))
        favorite.append(Event(name: "Formula",
                              city: "Jeddah",
                              photo :  "Formula",
                              photo2: "Riyadh3" ,
                              from: "",
                              to: "",
                              starting: "",
                              ending: "",
                              season: "",
                              audince: "",
                              eventDetalis: ""))
        favorite.append(Event(name: "Athra",
                              city: "Khobar",
                              photo :  "Athra",
                              photo2: "Riyadh3" ,
                              from: ".....",
                              to: ".....",
                              starting: ".....",
                              ending: "",
                              season: "",
                              audince: "",
                              eventDetalis: ""))
        favorite.append(Event(name: "Dakar Rally",
                              city: "Around the country" ,
                              photo :"Dakar Rally",
                              photo2: "Riyadh3" ,
                              from: ".....",
                              to: ".....",
                              starting: ".....",
                              ending: ".....",
                              season: "",
                              audince: ".....",
                              eventDetalis: "....."))
        favorite.append(Event(name: "Safari",
                              city: "Riyadh",
                              photo :  "Safari",
                              photo2: "Riyadh3" ,
                              from: ".....",
                              to: ".....",
                              starting: ".....",
                              ending: ".....", season: "",
                              audince: ".....",
                              eventDetalis: "....."))
        favorite.append(Event(name: "Khobar Corniche",
                              city: "Khobar",
                              photo :  "Khobar Corniche",
                              photo2: "Riyadh3" ,
                              from: ".....",
                              to: ".....",
                              starting: ".....",
                              ending: ".....", season: "",
                              audince: ".....",
                              eventDetalis: "....."))
        favorite.append(Event(name: "Combat Filed",
                              city: "Riyadh",
                              photo : "Combat Filed",
                              photo2: "Riyadh3",
                              from: ".....",
                              to: ".....",
                              starting: ".....",
                              ending: ".....", season: "",
                              audince: ".....",
                              eventDetalis: "....."))
        favorite.append(Event(name: "Dakakin",
                              city: "Riyadh",
                              photo :  "Dakakin",
                              photo2: "Riyadh3" ,
                              from: ".....",
                              to: ".....",
                              starting: ".....",
                              ending: ".....", season: "",
                              audince: ".....",
                              eventDetalis: "....."))
    }
    
    
    
    // MARK: - functions
    
    //function to determine the number of rows of an array
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorite.count
    }
    
    //function to select the elements of an array
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SeeCell
        let data = favorite[indexPath.row]
        cell.setupCell(photo: data.photo, city : data.city , name: data.name)
        
        cell.curentImageName = data.photo
        cell.btnAddToMyTrip.tag = indexPath.row
        cell.btnAddToMyTrip.addTarget(self, action: #selector(addToTrip(sender:)), for: .touchUpInside )
        cell.myFavorite = myFavorite
        return cell
    }
    
    //function that is didSelect on the cells
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        let events = favorite[indexPath.row]
        selectedDetails = EventDetails(photo: events.photo2, name: events.name, from: events.from, to: events.to, starting: events.starting, ending: events.ending, season: events.season , audince: events.audince, overview: events.eventDetalis)
        performSegue(withIdentifier: Segues.toSeeMore.rawValue , sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.toSeeMore.rawValue {
            let dest = segue.destination as! SeeMore
            dest.selectedData = selectedDetails
        }
    }
    
    
    //function to change the style of the button
    @objc
    func addToTrip(sender : UIButton){
        print("")
        let currentImage = sender.imageView?.image
        if currentImage == UIImage(systemName: "heart.circle.fill"){
            sender.setImage(UIImage(systemName: "heart.circle"), for: .normal)
        }else{
            sender.setImage(UIImage(systemName: "heart.circle.fill"), for: .normal)
        }
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
}




