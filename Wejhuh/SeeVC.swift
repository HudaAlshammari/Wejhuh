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
    
    
    @IBOutlet weak var search: UISearchBar!
    
    //Variable to fill in details
    var selectedSee : Event?
    
    //Variable to
    var myFavorite = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seeCollectionView.delegate = self
        seeCollectionView.dataSource = self
        seeCollectionView.backgroundColor = UIColor.clear
        filterdata = favorite
        search.delegate = self
        setSee()
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
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    // MARK: - Array
    
    //Array of pictures, names and details
    var favorite = [Event]()
    
    
    // Fill in the array with data
    func setSee(){
        favorite.append(Event(name: "Sea Experiences",
                              city: "Jeddah",
                              photo : "WJ",
                              photo2: "WJ2" ,
                              from: "4:00 PM",
                              to: "12:00AM",
                              starting: "3 OCT 2021",
                              ending: "11 JAN 2021 ",
                              season: "All Season",
                              audince: "All",
                              eventDetalis: "This development phase is the largest development phase of the Jeddah waterfront, and there are services and elements that have been added for the first time at the level of Jeddah waterfronts, equipped with services suitable for all groups and ages .. " ,
                             latitude: "21.603217937030088" ,
                             longitude: "39.10753647827252"))
        
        
        
        favorite.append(Event(name: "Formula",
                              city: "Jeddah",
                              photo :  "Formula",
                              photo2: "Formula2" ,
                              from: "7:00 PM",
                              to: "12 : 00 AM",
                              starting: "1 Apr 2021",
                              ending: "16 Apr 2021",
                              season: " Jeddah season",
                              audince: "Public",
                              eventDetalis: "The Kingdom will host the first-ever Formula 1 Grand Prix in an international motor racing championship considered by many to be the most famous sporting event in the world .. If you are a fan of this type of racing and yearn for great times of suspense, excitement and challenge, all you have to do is tighten your belts and prepare for a special event in which the city of Jeddah will present what the world has never seen before !" ,
                              latitude: "21.603217937030088" ,
                              longitude: "39.10753647827252"))


        favorite.append(Event(name: "Athra",
                              city: "Khobar",
                              photo :  "Athra",
                              photo2: "Athra2" ,
                              from: "7:00 AM",
                              to: "12:00 AM",
                              starting: "1 Mar 2019",
                              ending: "11 Oct 2022",
                              season: "All season",
                              audince: "Public",
                              eventDetalis: "Ithra offers its visitors new and inspiring experiences that nurture creativity and a passion for learning, and enrich culture. Ithra is a beacon of change and a window to global experiences by encouraging creativity, inspiring minds, and empowering talent, and with the advancement of innovation and technology; The Kingdom of Saudi Arabia is keen to keep pace with this development at a harmonious pace .." ,
                              latitude: "21.603217937030088" ,
                              longitude: "39.10753647827252"))

        favorite.append(Event(name: "Dakar Rally",
                              city: "Around the country" ,
                              photo :"Dakar Rally",
                              photo2: "Dakar2" ,
                              from: "6:00 AM",
                              to: "6:30 PM",
                              starting: "1 Oct 2022",
                              ending: "28 Oct 2022",
                              season: "Jeddah season",
                              audince: "All",
                              eventDetalis: "The starting point will be from the Hail region, towards the capital, Riyadh, and the stop in Riyadh will be a one-day break, then the contestants will continue their challenge to the city of Jeddah .. This year's rally track will include two circuit stages in addition to a marathon stage .." ,
                              latitude: "21.603217937030088" ,
                              longitude: "39.10753647827252"))

        favorite.append(Event(name: "Safari",
                              city: "Riyadh",
                              photo :  "Safari",
                              photo2: "Safari2" ,
                              from: "3:00 PM",
                              to: "11:00 PM",
                              starting: "12 Jan 2021",
                              ending: "2 Feb 2021",
                              season: "Riyadh season",
                              audince: "All",
                              eventDetalis: "Wildlife Center on your trip to Safari Nova, to see a variety of indigenous and exotic animals, such as hawks, owls, reptiles, jerboas and other wild animals, but the most prominent thing that will attract your attention and hold your breath is watching the leopard animals, which will charm your senses with its beauty and steal your heart with its gracefulness away from you In just a few steps .." ,
                              latitude: "21.603217937030088" ,
                              longitude: "39.10753647827252"))


        favorite.append(Event(name: "Oasis",
                              city: "Riyadh",
                              photo : "Oasis",
                              photo2: "Oasis2" ,
                              from: "8:00 PM",
                              to: "2:00 AM",
                              starting: "12 Jan 2021",
                              ending: "3 Apr 2021", season: "Riyadh season",
                              audince: "All",
                              eventDetalis: "A luxury entertainment project in the heart of the desert north of Riyadh; It includes a variety of different activities and activities such as shopping, music, culture and sports, in addition to luxury camps that accommodate up to eight people .." ,
                              latitude: "21.603217937030088" ,
                              longitude: "39.10753647827252"))


        favorite.append(Event(name: "Combat Filed",
                              city: "Riyadh",
                              photo : "Combat Filed",
                              photo2: "Combat Filed2",
                              from: "2 Dec 2021",
                              to: "1 Mar 2021",
                              starting: "4:00 PM",
                              ending: "2:00 AM",
                              season: "Riyadh season",
                              audince: "12 +",
                              eventDetalis: "An amusement park that simulates war and combat games, here in Riyadh! Combat field is a world where you live the meaning of action and excitement, prove to us your shooting skills and your heart strength as you descend from the top of the zipline. Unmissable adventures between the details of different historical areas, watch live shows and live the life of a cowboy and fight your opponents in virtual reality .." ,
                              latitude: "21.603217937030088" ,
                              longitude: "39.10753647827252"))

        favorite.append(Event(name: "MSC bellissima(Getaway.. Your Way)",
                              city: "Jeddah",
                              photo :  "MSC",
                              photo2: "MSC2" ,
                              from: "1 Nov 2021",
                              to: "30 Mar 2021",
                              starting: "6:00 PM",
                              ending: "3:00 AM", season: "All Seasons",
                              audince: "All",
                              eventDetalis: "The cruise ship, which is owned and operated by MSC Cruises, can accommodate 4,500 passengers and has a crew of about 1,500 .." ,
                              latitude: "21.603217937030088" ,
                              longitude: "39.10753647827252"))
    }
    
    // MARK: - =========
    var filterdata = [Event]()
    var searching = false
    
    
    
    
    
    
    // MARK: - functions
    
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
        
        cell.btnAddToMyTrip.tag = indexPath.row
        cell.btnAddToMyTrip.addTarget(self, action: #selector(addToTrip(sender:)), for: .touchUpInside )
        
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
    
    
    //function to change the style of the button
    @objc
    func addToTrip(sender : UIButton){
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

