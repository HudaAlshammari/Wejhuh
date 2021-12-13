//
//  Discover.swift
//  Wejhuh
//
//  Created by Huda N S on 09/05/1443 AH.
//

import UIKit

class Discover: UIViewController {

    @IBOutlet weak var detailsImage: UIImageView!
    
    @IBOutlet weak var detailsTitle: UILabel!
    
    @IBOutlet weak var details: UILabel!
    
    var dataSend = ""
//    var image = UIImage
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTitle.text = dataSend
        details.text = dataSend
//        detailsImage.image = image
    }
}
