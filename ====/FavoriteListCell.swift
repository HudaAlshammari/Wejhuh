//
//  favoriteListCell.swift
//  Wejhuh
//
//  Created by Huda N S on 14/05/1443 AH.
//

import UIKit
import FirebaseAuth




class FavoriteListCell: UICollectionViewCell {
    
        @IBAction func deletePressed(_ sender: Any) {
            self.deleteFavFromFireStore(favIndex: 0)
        }
    
    var myFavorite = [String]()
    // Outlet of items in cells
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        //Formats for cell
        view.layer.cornerRadius = 12

    }
    
    func deleteFavFromFireStore(favIndex: Int){
        myFavorite.remove(at: favIndex)
        UserApi.addLikes(uid: Auth.auth().currentUser?.uid ?? "", likes: myFavorite)
        self.deleteFavFromFireStore(favIndex: 0)
    }
}
