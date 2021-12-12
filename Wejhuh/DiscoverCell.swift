//
//  DiscoverCollectionViewCell.swift
//  Wejhuh
//
//  Created by Huda N S on 03/05/1443 AH.
//

import UIKit

class DiscoverCell: UICollectionViewCell {
    @IBOutlet weak var background : UIView!
    @IBOutlet weak var image : UIImageView!
    @IBOutlet weak var titel : UILabel!
    
    override func awakeFromNib() {
        background.layer.cornerRadius = 12
        image.layer.cornerRadius = 12
    }
    func setupCell(photo : UIImage , name : String){
        image.image = photo
        titel.text = name
    }
}
