//
//  naturalCitiesCell.swift
//  Wejhuh
//
//  Created by Huda N S on 05/05/1443 AH.
//

import UIKit

class NaturalCitiesCell: UICollectionViewCell {
    
    // Outlet of items in cells
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var naturalCitiesNames: UILabel!
    @IBOutlet weak var naturalCitiesPhoto: UIImageView!
    
    override func awakeFromNib() {
        //Formats for cell
        imageView.layer.cornerRadius = 12
    }
    
    //Function to setup items in cells
    func setupCell(photo : UIImage , name : String){
        naturalCitiesPhoto.image = photo
        naturalCitiesNames.text = name
    }
}
