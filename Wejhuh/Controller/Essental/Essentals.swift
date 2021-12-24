//
//  Essentals.swift
//  Wejhuh
//
//  Created by Huda N S on 09/05/1443 AH.
//

import UIKit

class Essentals: UIViewController {

    @IBOutlet weak var essentalPhoto: UIImageView!
    @IBOutlet weak var essentalTitle: UILabel!
    @IBOutlet weak var essentalDes: UILabel!
    
    var imageEssentaltSet: UIImage?
    var nameEssentalSet: String?
    var desEssentalSet: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        essentalPhoto.layer.cornerRadius = 35
        
        essentalPhoto.image = imageEssentaltSet
        essentalTitle.text = nameEssentalSet
        essentalDes.text = desEssentalSet
    }
}
