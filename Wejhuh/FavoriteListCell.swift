//
//  favoriteListCell.swift
//  Wejhuh
//
//  Created by Huda N S on 14/05/1443 AH.
//

import UIKit

class FavoriteListCell: UICollectionViewCell {
    
    // Outlet of items in cells
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        //Formats for cell
        view.layer.cornerRadius = 12
    }
}
