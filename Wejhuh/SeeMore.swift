//
//  SeeMore.swift
//  Wejhuh
//
//  Created by Huda N S on 15/05/1443 AH.
//

import UIKit
import CoreData

class SeeMore: UIViewController {

    var selectedData : EventDetails!
    
    
    //Outlet of items of CollectionView
    @IBOutlet weak var seeImge: UIImageView!
    @IBOutlet weak var seeName: UILabel!
    
    
    
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var to: UILabel!
    
    
    @IBOutlet weak var ending: UILabel!
    @IBOutlet weak var starting: UILabel!
    
    
    @IBOutlet weak var audience: UILabel!
    @IBOutlet weak var season: UILabel!
    
    @IBOutlet weak var overview: UILabel!
    
    
    var selectedArrayTrips : Trips!
    var arrayTrip = [Trips]()
    var curentImageName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Formats for cell
        seeImge.layer.cornerRadius = 35
        
        seeImge.image = selectedData.photo
        seeName.text = selectedData.name
        from.text = selectedData.from
        to.text = selectedData.to
        starting.text = selectedData.starting
        ending.text = selectedData.ending
        audience.text = selectedData.audince
        overview.text = selectedData.overview
        
    }
}



