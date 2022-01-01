//
//  SeeMore.swift
//  Wejhuh
//
//  Created by Huda N S on 15/05/1443 AH.
//

import UIKit
import CoreData

class SeeMore: UIViewController {

    //Outlet of items of CollectionView
    @IBOutlet weak var seeImge: UIImageView!
    @IBOutlet weak var seeName: UILabel!
    
    //
    var selectedArrayTrips : Trips!
    var arrayTrip = [Trips]()
    var curentImageName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Formats for cell
        seeImge.layer.cornerRadius = 35
    }
}
