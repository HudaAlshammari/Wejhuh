//
//  ExtensionDiscoverVC.swift
//  Wejhuh
//
//  Created by Huda N S on 11/05/1443 AH.
//

import Foundation
import UIKit

extension SeeVC : UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorite.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        selectedSee = favorite[indexPath.row]
        performSegue(withIdentifier: "seeDetail", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SeeCell
        let data = favorite[indexPath.row]
        cell.setupCell(photo: data.photo, city : data.city , name: data.name)
        cell.btnAddToMyTrip.tag = indexPath.row
        cell.btnAddToMyTrip.addTarget(self, action: #selector(addToMyTrip(sender:)), for: .touchUpInside )
        return cell
    }
    
    @objc
    func addToMyTrip(sender : UIButton){
        sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
    
    func storeFavorite(){
        
    }
}
