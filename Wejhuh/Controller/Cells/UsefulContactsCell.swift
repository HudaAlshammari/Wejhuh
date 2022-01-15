//
//  UsefulContactsCell.swift
//  Wejhuh
//
//  Created by Huda N S on 07/06/1443 AH.
//

import UIKit

class UsefulContactsCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var number: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(names : String , numbers : String){
        title.text = names
        number.text = numbers
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
