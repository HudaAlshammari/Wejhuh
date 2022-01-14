//
//  FavoritesListCell.swift
//  Wejhuh
//
//  Created by Huda N S on 10/06/1443 AH.
//

import UIKit

class FavoritesListCell: UITableViewCell {

    // Outlet of items in cells
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 12
        photo.layer.cornerRadius = 12
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
//    }

}
