//
//  AncientCitiesCell.swift
//  Wejhuh
//
//  Created by Huda N S on 08/05/1443 AH.
//

import UIKit

class AncientCitiesCell: UICollectionViewCell {
    
    // Outlet of items in cells
    @IBOutlet weak var ancientCitiesView: UIView!
    @IBOutlet weak var ancientName: UILabel!
    @IBOutlet weak var ancientImage: UIImageView!
    
    //Function to setup items in cells
    func setupCell(photo : UIImage , name : String){
        ancientImage.image = photo
        ancientName.text = name
    }
}
