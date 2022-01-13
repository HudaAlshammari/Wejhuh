//
//  SeeCell.swift
//  Wejhuh
//
//  Created by Huda N S on 08/05/1443 AH.
//

import UIKit
import CoreData
import FirebaseAuth
import FirebaseFirestore


class SeeCell: UICollectionViewCell {
    
    var curentImageName: String?

    // MARK: - Cell
    
    // Outlet of items in cells
    @IBOutlet weak var seeView: UIView!
    @IBOutlet weak var seeCity: UILabel!
    @IBOutlet weak var seeName: UILabel!
    @IBOutlet weak var seeImage: UIImageView!

    
    override func awakeFromNib() {
        //Formats for cell
        seeImage.layer.cornerRadius = 12
        seeView.layer.cornerRadius = 12
    }
    
    //Function to setup items in cells
    func setupCell(photo : String ,city : String , name : String){
        seeImage.image = UIImage(named:photo)
        seeName.text = name
        seeCity.text = city
}
}
