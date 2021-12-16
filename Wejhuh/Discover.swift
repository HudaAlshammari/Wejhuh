//
//  Discover.swift
//  Wejhuh
//
//  Created by Huda N S on 09/05/1443 AH.
//

import UIKit

class Discover: UIViewController {

    var selectedSetData : SetDetails!
    
    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var detailsTitle: UILabel!
    @IBOutlet weak var details: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsImage.layer.cornerRadius = 35
        detailsImage.image = selectedSetData.photo
        detailsTitle.text = selectedSetData.title
        details.text = selectedSetData.details
    }
}
