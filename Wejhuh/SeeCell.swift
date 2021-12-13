//
//  SeeCell.swift
//  Wejhuh
//
//  Created by Huda N S on 08/05/1443 AH.
//

import UIKit

class SeeCell: UICollectionViewCell {
    
    @IBOutlet weak var seeView: UIView!
    @IBOutlet weak var seeCity: UILabel!
    @IBOutlet weak var seeName: UILabel!
    @IBOutlet weak var seeImage: UIImageView!
    
    override func awakeFromNib() {
        seeImage.layer.cornerRadius = 12
        seeView.layer.cornerRadius = 12
    }
    func setupCell(photo : UIImage ,city : String , name : String){
        seeImage.image = photo
        seeName.text = name
        seeCity.text = city
}
}
