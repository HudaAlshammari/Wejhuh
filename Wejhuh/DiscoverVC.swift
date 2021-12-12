//
//  ViewController.swift
//  Wejhuh
//
//  Created by Huda N S on 02/05/1443 AH.
//

import UIKit

class DiscoverVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet var naturalCities: UICollectionView!
    @IBOutlet weak var ancientCities: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homeCollectionView.backgroundColor = UIColor.clear
        naturalCities.backgroundColor = UIColor.clear
        ancientCities.backgroundColor = UIColor.clear
        ancientCities.delegate = self
        ancientCities.dataSource = self
        setCity()
        setNaturalCities()
        setAncientCities()
    }
    
    var cityArray = [City]()
    var naturalCity = [NaturalCities]()
    var ancientCity = [AncientCities]()
    
    func setCity(){
        cityArray.append(City(name: "Al-Suwdah", photo: UIImage(named: "sudah")!))
        cityArray.append(City(name: "Al-Ula", photo: UIImage(named: "Ula")!))
        cityArray.append(City(name: "Riyadh", photo: UIImage(named: "Riyadh")!))
        cityArray.append(City(name: "Al-Baha", photo: UIImage(named: "Baha")!))
        cityArray.append(City(name: "Rijal Almae", photo: UIImage(named: "Rijalalmae")!))
        cityArray.append(City(name: "Hail", photo: UIImage(named: "Hail")!))
        cityArray.append(City(name: "Jeddah", photo: UIImage(named: "Jeddah")!))
    }
    
    func setNaturalCities(){
        naturalCity.append(NaturalCities(name: "Asir", photo: UIImage(named: "3seer")!))
        naturalCity.append(NaturalCities(name: "Hail", photo: UIImage(named: "hail2")!))
        naturalCity.append(NaturalCities(name: "Al-Suwdah", photo: UIImage(named: "sudah2")!))
        naturalCity.append(NaturalCities(name: "Abha", photo: UIImage(named: "abha")!))
    }
    
    func setAncientCities(){
        ancientCity.append(AncientCities(name: "Riyadh", photo: UIImage(named: "990")!))
        ancientCity.append(AncientCities(name: "Al-Ula", photo: UIImage(named: "900")!))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (collectionView == homeCollectionView ){
            return cityArray.count
            
        }else if (collectionView == naturalCities ){
            return naturalCity.count
            
        }else{
            return ancientCity.count
        }
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == naturalCities){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! naturalCitiesCell
            let data = naturalCity[indexPath.row]
            cell.setupCell(photo: data.photo, name: data.name)
            return cell
            
        } else if (collectionView == homeCollectionView ){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! DiscoverCell
            let data = cityArray[indexPath.row]
            cell.setupCell(photo: data.photo, name: data.name)
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! AncientCitiesCell
            
            let data = ancientCity[indexPath.row]
            cell.setupCell(photo: data.photo, name: data.name)
            return cell
        }
    }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            if (collectionView == naturalCities){
                performSegue(withIdentifier: "h", sender: nil)
            }
            else{
                print("ggg")
            }
            
        }
}





struct City {
    let name : String
    let photo : UIImage
}

struct NaturalCities {
    let name : String
    let photo : UIImage
}

struct AncientCities{
    let name : String
    let photo : UIImage
}
