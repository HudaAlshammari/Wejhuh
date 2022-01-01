//
//  Discover.swift
//  Wejhuh
//
//  Created by Huda N S on 09/05/1443 AH.
//

import UIKit

class Discover: UIViewController {

    //Variable to fill in details
    var selectedSetData : SetDetails!
    
    //Outlet of items of CollectionView
    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var detailsTitle: UILabel!
    @IBOutlet weak var details: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Formats for CollectionView
        detailsImage.layer.cornerRadius = 35
        
        // for Set details
        detailsImage.image = selectedSetData.photo
        detailsTitle.text = selectedSetData.title
        details.text = selectedSetData.details
    }
}
