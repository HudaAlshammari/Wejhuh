//
//  EssentalsCell.swift
//  Wejhuh
//
//  Created by Huda N S on 06/05/1443 AH.
//

import UIKit

class EssentalsCell: UICollectionViewCell {
    
    // Outlet of items in cells
    @IBOutlet weak var EssentalsTitle: UILabel!
    @IBOutlet weak var EssentalsPhoto: UIImageView!
    @IBOutlet weak var EssentalsView: UIView!
    @IBOutlet weak var EssentalsDic: UILabel!
    
    override func awakeFromNib() {
        //Formats for cell
        EssentalsView.layer.cornerRadius = 12
    }
    
    //Function to setup items in cells
    func setupCell(photo : UIImage , titel : String ,details : String ){
        EssentalsPhoto.image = photo
        EssentalsTitle.text = titel
        EssentalsDic.text = details
}
}
