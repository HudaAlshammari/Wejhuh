//
//  DiscoverCollectionViewCell.swift
//  Wejhuh
//
//  Created by Huda N S on 03/05/1443 AH.
//

import UIKit

class DiscoverCell: UICollectionViewCell {
    
    // Outlet of items in cells
    @IBOutlet weak var background : UIView!
    @IBOutlet weak var image : UIImageView!
    @IBOutlet weak var titel : UILabel!
    
    override func awakeFromNib() {
        //Formats for cell
        background.layer.cornerRadius = 12
        image.layer.cornerRadius = 12
    }
    
    //Function to setup items in cells
    func setupCell(photo : UIImage , name : String){
        image.image = photo
        titel.text = name
    }
}
