//
//  Discover.swift
//  Wejhuh
//
//  Created by Huda N S on 09/05/1443 AH.
//

import UIKit

class Discover: UIViewController {

    var selectedSetData : SetDetails!
//    var selectedSetData2 : SetDetails2!
    
    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var detailsTitle: UILabel!
    @IBOutlet weak var details: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsImage.layer.cornerRadius = 35
        
        
        detailsImage.image = selectedSetData.photo
        detailsTitle.text = selectedSetData.title
        details.text = selectedSetData.details
        
//        detailsImage.image = selectedSetData2.photo
//        detailsTitle.text = selectedSetData2.title
//        details.text = selectedSetData2.details
    }
}
