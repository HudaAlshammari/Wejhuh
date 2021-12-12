//
//  naturalCitiesCell.swift
//  Wejhuh
//
//  Created by Huda N S on 05/05/1443 AH.
//

import UIKit

class naturalCitiesCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var naturalCitiesNames: UILabel!
    @IBOutlet weak var naturalCitiesPhoto: UIImageView!
    
    override func awakeFromNib() {
        imageView.layer.cornerRadius = 12
//        naturalCitiesPhoto.layer.cornerRadius = 12
    }
    func setupCell(photo : UIImage , name : String){
        naturalCitiesPhoto.image = photo
        naturalCitiesNames.text = name
    }
}
