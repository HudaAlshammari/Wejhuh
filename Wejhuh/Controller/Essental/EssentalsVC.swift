//
//  EssentalsVC.swift
//  Wejhuh
//
//  Created by Huda N S on 06/05/1443 AH.
//

import UIKit
import SwiftUI

class EssentalsVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
    // MARK: - CollectionView of Essentals
    
    // Outlet of CollectionView
    @IBOutlet weak var Essentals: UICollectionView!
    
    //Variable to fill in details
    var selectedDetails : SetDetails?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Essentals.delegate = self
        Essentals.dataSource = self
        
        //Formats for CollectionView
        Essentals.backgroundColor = UIColor.clear
        Essentals.layer.shadowColor = UIColor.placeholderText.cgColor
        Essentals.layer.shadowOpacity = 10
        Essentals.layer.shadowOffset = .zero
        Essentals.layer.shadowRadius = 3
        setEssentals()
    }
    
    //Arrays of pictures, names and details
    var essentaltSet = [Essental]()

    
    // MARK: - Fill in the array with data
    func setEssentals(){
        essentaltSet.append(Essental(Title: "Safety travel tips",
                                     photo: UIImage(named: "essentals1")!,
                                     photo2: UIImage(named: "essentals1")!,
                                     dec: "stay informed ..",
                                     details: "kxmmlwqmwzl"))
        essentaltSet.append(Essental(Title: "Laws and etiqutte",
                                     photo: UIImage(named: "essentals2")!,
                                     photo2: UIImage(named: "essentals2")!,
                                     dec: "It is a rule in Saudi Arabia ..",
                                     details: ""))
        essentaltSet.append(Essental(Title: "The seasonse and climate in KSA",
                                     photo: UIImage(named: "essentals3")!,
                                     photo2: UIImage(named: "essentals3")!,
                                     dec: "The spring season in the Kingdom .." ,
                                     details: ""))
        essentaltSet.append(Essental(Title: "The culuter and language of KSA",
                                     photo: UIImage(named: "essentals4")!,
                                     photo2: UIImage(named: "essentals4")!,
                                     dec: "language in the Kingdom of ..",
                                     details: ""))
        essentaltSet.append(Essental(Title: "Saudi currency and payments",
                                     photo: UIImage(named: "essentals5")!,
                                     photo2: UIImage(named: "essentals5")!,
                                     dec: "Currency exchange and transactions ..",
                                     details: ""))
        essentaltSet.append(Essental(Title: "About  eVisa",
                                     photo: UIImage(named: "essentals6")!,
                                     photo2: UIImage(named: "essentals6")!,
                                     dec: "The Kingdom of Saudi Arabia has ..",
                                     details: ""))
    }
    
    
    // MARK: - functions
    
    //function to determine the number of rows of an array
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return essentaltSet.count
    }
    
    //function to select the elements of an array
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EssentalsCell
        let data = essentaltSet[indexPath.row]
        cell.setupCell(photo: data.photo, titel: data.Title, details: data.dec )
        return cell
    }
    
    //function that is didSelect on the cells
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let essental = essentaltSet[indexPath.row]
        selectedDetails = SetDetails(photo: essental.photo2 , title: essental.Title
                                     , details: essental.details)
        performSegue(withIdentifier: Segues.toEssentals.rawValue , sender: nil)
    }
    
    // prepare segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.toEssentals.rawValue {
            let dest = segue.destination as! Essentals
            dest.selectedSetData = selectedDetails
        }
    }
    
    
    // MARK: - buttons
    
    //button for URL
    @IBAction func URLVisitSaudi(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.visitsaudi.com/en")! as URL , options: [:], completionHandler: nil)
    }
    
    @IBAction func SaudiTourismAuthority(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.sta.gov.sa/ar/")! as URL , options: [:], completionHandler: nil)
    }
}
