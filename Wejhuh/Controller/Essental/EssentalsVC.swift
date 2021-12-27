//
//  EssentalsVC.swift
//  Wejhuh
//
//  Created by Huda N S on 06/05/1443 AH.
//

import UIKit
import SwiftUI

class EssentalsVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var Essentals: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Essentals.dataSource = self
        Essentals.delegate = self
        Essentals.backgroundColor = UIColor.clear
    }
    
    
    var imageEssentaltSet: UIImage?
    var nameEssentalSet: String?
    var desEssentalSet: String?
    
    
    let EssentalsImages = ["essentals1" , "essentals2" , "essentals3" , "essentals4" , "essentals5" , "essentals6"]
    let EssentalsTitles = ["Safety travel tips" , "Laws and etiqutte" , "The seasonse and climate in KSA" , "The culuter and language of KSA" , "Saudi currency and payments" , "About  eVisa"]
    
    let EssentalsaDicc = ["stay informed .." , "It is a rule in Saudi Arabia .." , "The spring season in the Kingdom .." , "language in the Kingdom of .." , "Currency exchange and transactions .." , "The Kingdom of Saudi Arabia has .."]
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        switch indexPath.row {
        case 0 :
            imageEssentaltSet = UIImage(named: "ksa1")
            nameEssentalSet = "Safety travel tips"
            desEssentalSet = "stay informed..\nWhile the restrictions related to travel are eased, you can ensure that you receive the latest advice in the best way available, by following government guidelines.\nThe Saudi Ministry of Health offers a special electronic application under the name (Mawd) for smart phones, which displays the latest health recommendations, and a hotline is available at 937 .."
        case 1 :
            imageEssentaltSet = UIImage(named: "ksa2" )
            nameEssentalSet = "Laws and etiqutte"
            desEssentalSet = "Swearing, loud behavior, and violating the boundaries of others are behaviors that show a lack of respect.\nIt is advised to respect public decency at all times..\nIt is a rule in Saudi Arabia that some shops close their doors during prayer times for a short period in order to make room for worship.\nDuring the blessed month of Ramadan, the atmosphere in the Kingdom turns into a joyful spiritual atmosphere and allows you to enjoy the greatness of the holy month..\nAlso, the buying, selling and consuming of alcoholic beverages and drugs is illegal in the Kingdom of Saudi Arabia .."
        case 2 :
            imageEssentaltSet = UIImage(named: "ksa3" )
            nameEssentalSet = "The seasonse and climate in KSA"
            desEssentalSet = "The spring season in the Kingdom is relatively cold, especially in the north, where the temperature at night can drop to less than 15 degrees. The central and southern regions are much warmer, with an average temperature of about 20 degrees at night. Rainfall in the spring also reaches its highest levels, especially in the central region and the southwest of the Kingdom over the Asir Mountains .."
        case 3 :
            imageEssentaltSet = UIImage(named: "ksa4" )
            nameEssentalSet = "The culuter and language of KSA"
            desEssentalSet = "Language: Arabic is the official language in the Kingdom of Saudi Arabia and is the main language used in public dealings and transactions. English is an unofficial second language in the Kingdom and is spoken by a large portion of the population. All traffic panels display information in both Arabic and English.. The Kingdom of Saudi Arabia has a rich heritage and ancient traditions, as it was a major commercial center throughout history and witnessed the birth of the Islamic religion. In recent years, the Kingdom has undergone an important cultural transformation, where centuries-old customs have been developed in line with our contemporary times .."
        case 4 :
            imageEssentaltSet = UIImage(named: "ksa5" )
            nameEssentalSet = "Saudi currency and payments"
            desEssentalSet = "Currency exchange and transactions can be done easily in Saudi Arabia. The official currency of Saudi Arabia is the Saudi riyal (SAR), and the riyal consists of 100 halalas. Banknotes are available in denominations of 5 riyals, 10 riyals, 50 riyals, 100 riyals, and 500 riyals, and coins in denominations of one riyal, two riyals, 50 halalas, 25 halalas, 10 halalas, 5 halalas and one halala .."
        case 5 :
            imageEssentaltSet = UIImage(named: "ksa6" )
            nameEssentalSet = "About  eVisa"
            desEssentalSet = "The Kingdom of Saudi Arabia has opened its doors to visitors from all over the world with the electronic visa system as of September 2019. Visitors can obtain a one-year entry visa that entitles them to enter the country multiple times and allows them to stay for a maximum of 90 days during its validity period. This visa can be used for tourism and Umrah activities (except for the Hajj season), and it does not include other activities such as studying.. The visa system was a milestone that opened the doors of the Kingdom of Saudi Arabia to tourists. Visitors from all over the world can discover the hospitality of the Saudi people with its rich heritage, vibrant culture and stunning natural landscapes, from the mountains of Abha to the shores of the Red Sea all the way to the shifting sands of the Empty Quarter desert .."
        default:
            print("")
        }
        performSegue(withIdentifier: Segues.toEssentals.rawValue , sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! Essentals
        vc.nameEssentalSet = nameEssentalSet
        vc.imageEssentaltSet = imageEssentaltSet
        vc.desEssentalSet = desEssentalSet
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return EssentalsImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EssentalsCell
        cell.EssentalsPhoto.image = UIImage(named: EssentalsImages[indexPath.row])
        cell.EssentalsTitle.text = EssentalsTitles[indexPath.row]
        cell.EssentalsDic.text = EssentalsaDicc[indexPath.row]
        return cell
    }
}




