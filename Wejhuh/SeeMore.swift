//
//  SeeMore.swift
//  Wejhuh
//
//  Created by Huda N S on 15/05/1443 AH.
//

import UIKit
import CoreData

class SeeMore: UIViewController {

    
    @IBOutlet weak var seeImge: UIImageView!
    @IBOutlet weak var seeName: UILabel!
    
    var selectedArrayTrips : Trips!
    var arrayTrip = [Trips]()
    var curentImageName: String?
    
//    //CORE-DATA
//    let persistentContainer : NSPersistentContainer = {
//       let container = NSPersistentContainer(name: "FavoriteModel")
//       container.loadPersistentStores(completionHandler: { desc, error in
//           if let readError = error {
//               print(readError)
//           }
//       })
//       return container
//   }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seeImge.layer.cornerRadius = 35

        // Do any additional setup after loading the view.
    }
    

//    @IBAction func addFavoritePlaces2(_ sender: Any) {
////        createNewList(eventName: seeName.text ?? "" , eventPhoto: curentImageName ?? "")
//    }
//    
//    //CORE-DATA
//    func createNewList(eventName: String, eventPhoto: String){
//        let context = persistentContainer.viewContext
//        context.performAndWait {
//            let list = TripsList(context: context)
//            list.name = eventName
//            list.photo = eventPhoto
//            do {
//                try context.save()
//            } catch {
//                print(error)
//            }
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
