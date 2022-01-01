//
//  Essentals.swift
//  Wejhuh
//
//  Created by Huda N S on 09/05/1443 AH.
//

import UIKit

class Essentals: UIViewController {

    //Variable to fill in details
    var selectedSetData : SetDetails!
    
    //Outlet of items of CollectionView
    @IBOutlet weak var essentalPhoto: UIImageView!
    @IBOutlet weak var essentalTitle: UILabel!
    @IBOutlet weak var essentalDes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // for Set details
        essentalPhoto.image = selectedSetData.photo
        essentalTitle.text = selectedSetData.title
        essentalDes.text = selectedSetData.details
    }
}
