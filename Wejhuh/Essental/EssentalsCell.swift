//
//  EssentalsCell.swift
//  Wejhuh
//
//  Created by Huda N S on 06/05/1443 AH.
//

import UIKit

class EssentalsCell: UICollectionViewCell {
    
    @IBOutlet weak var EssentalsTitle: UILabel!
    @IBOutlet weak var EssentalsPhoto: UIImageView!
    @IBOutlet weak var EssentalsView: UIView!
    @IBOutlet weak var EssentalsDic: UILabel!
    
    override func awakeFromNib() {
        EssentalsView.layer.cornerRadius = 12
        EssentalsPhoto.layer.cornerRadius = 12
    }
}
