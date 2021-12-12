//
//  EssentalsVC.swift
//  Wejhuh
//
//  Created by Huda N S on 06/05/1443 AH.
//

import UIKit

class EssentalsVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var Essentals: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Essentals.dataSource = self
        Essentals.delegate = self
        Essentals.backgroundColor = UIColor.clear
    }
    
    let EssentalsImages = ["1234" , "0" , "888" , "999" , "33" , "44"]
    let EssentalsTitles = ["Getting Around" , "Laws and etiqutte" , "The seasonse and climate in KSA" , "The culuter and language of KSA" , "Saudi currency and payments" , "About  eVisa"]
    let EssentalsaDicc = ["Getting Around too saudi arabia" , "ajknjajnka" , "aknankanlka" , "aknnlankaLKNkn" , "lsakla`lkn`klanlk`nkmsl" , "ajkjanklankm;la"]
    
    
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
