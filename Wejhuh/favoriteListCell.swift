//
//  favoriteListCell.swift
//  Wejhuh
//
//  Created by Huda N S on 14/05/1443 AH.
//

import UIKit

class favoriteListCell: UICollectionViewCell {
    
    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
//        background.layer.cornerRadius = 12
        view.layer.cornerRadius = 12
    }
}
