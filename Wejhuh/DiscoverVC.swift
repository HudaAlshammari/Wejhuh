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
    
    var selectedSetDetails : SetDetails?
//    var selectedSetDetails2 : SetDetails2!
//    var selectedSetDetails3 : SetDetails3!
    
    
    
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
        
//        naturalCities.layer.shadowColor = UIColor.black.cgColor
//        naturalCities.layer.shadowOpacity = 1
//        naturalCities.layer.shadowOffset = .zero
//        naturalCities.layer.shadowRadius = 8
    }
    
    
    
    var cityArray = [City]()
    var naturalCity = [NaturalCities]()
    var ancientCity = [AncientCities]()
    
    
    var selectedCityArray:City?
    var selectedNaturalCity:NaturalCities?
    var selectedAncientCity: AncientCities?
    
    
    
    
    func setCity(){
        cityArray.append(City(name: "Al-Suwdah",
                              photo: UIImage(named: "sudah")!,
                              photo2: UIImage(named: "details3")!,
                              detail: "Al-Soudah is a tourist village in the Asir region of the Kingdom of Saudi Arabia, 20 km from the city of Abha, at an altitude of 3015 meters above sea level, and its mountains are covered with dense juniper trees, forming beautiful natural forests .. Al-Soudah overlooks the Tihama region, so magnifying glasses have been installed in some of its parts as views to see the wonderful views of those valleys, valleys and neighboring villages located in the Tihama plains. The village records temperatures that do not exceed 15 degrees Celsius in the summer, while the temperatures in the winter are very low. Compared to the surrounding areas, the Al-Soudah tourist village was built, which includes a range of services, and the park was linked to the village of Rijal Alma in the Tihama region by cable car, which is about 40 km from Abha city .."))
        
        cityArray.append(City(name: "Al-Ula",
                              photo: UIImage(named: "Ula")!,
                              photo2: UIImage(named: "Ula")!,
                              detail: ""))
        cityArray.append(City(name: "Riyadh",
                              photo: UIImage(named: "Riyadh")!,
                              photo2: UIImage(named: "Ula")!,
                              detail: ""))
        cityArray.append(City(name: "Al-Baha",
                              photo: UIImage(named: "Baha")!,
                              photo2: UIImage(named: "Ula")!,
                              detail: ""))
        cityArray.append(City(name: "Rijal Almae",
                              photo: UIImage(named: "Rijalalmae")!,
                              photo2: UIImage(named: "Ula")!,
                              detail: ""))
        cityArray.append(City(name: "Hail",
                              photo: UIImage(named: "Hail")!,
                              photo2: UIImage(named: "Ula")!,
                              detail: ""))
        cityArray.append(City(name: "Jeddah",
                              photo: UIImage(named: "Jeddah")!,
                              photo2: UIImage(named: "Ula")!,
                              detail: ""))
    }
    
    
    
    
    func setNaturalCities(){
        naturalCity.append(NaturalCities(name: "Asir",
                                         photo: UIImage(named: "3seer")!,
                                         photo2: UIImage(named: "sudah2")!,
                                         detail: "...."))
        naturalCity.append(NaturalCities(name: "Hail",
                                         photo: UIImage(named: "hail2")!,
                                         photo2: UIImage(named: "sudah2")!,
                                         detail: ".."))
        naturalCity.append(NaturalCities(name: "Al-Suwdah",
                                         photo: UIImage(named: "sudah2")!,
                                         photo2: UIImage(named: "sudah2")!,
                                         detail: ""))
        naturalCity.append(NaturalCities(name: "Abha",
                                         photo: UIImage(named: "abha")!,
                                         photo2: UIImage(named: "sudah2")!,
                                         detail: ""))
    }
    
    func setAncientCities(){
        ancientCity.append(AncientCities(name: "Riyadh",
                                         photo: UIImage(named: "R")!,
                                         photo2: UIImage(named: "sudah2")!,
                                         detail: "[[[[]]]]]"))
        ancientCity.append(AncientCities(name: "Al-Ula",
                                         photo: UIImage(named: "O")!,
                                         photo2: UIImage(named: "sudah2")!,
                                         detail: "-------"))
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
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        switch collectionView {
        case homeCollectionView :
            let city = cityArray[indexPath.row]
            selectedSetDetails = SetDetails(photo: city.photo2,
                                            title: city.name,
                                            details: city.detail)
            
        case naturalCities :
            let natural = naturalCity[indexPath.row]
            selectedSetDetails = SetDetails(photo: natural.photo2 ,
                                              title: natural.name,
                                              details: natural.detail)
            
        case ancientCities :
            let ancient = ancientCity[indexPath.row]
            selectedSetDetails = SetDetails(photo: ancient.photo2 ,
                                              title: ancient.name,
                                              details: ancient.detail)
            
        default :
            print("......")
            
        }
        performSegue(withIdentifier: "h", sender: nil)
    }
    
    @IBAction func profile(_ sender: UIButton) {
        performSegue(withIdentifier: "toProfile", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "h" {
            
            let dest = segue.destination as! Discover
            dest.selectedSetData = selectedSetDetails
            
        }
        
    }
    
    
}





struct City {
    let name : String
    let photo : UIImage
    let photo2 : UIImage
    let detail : String
}

struct NaturalCities {
    let name : String
    let photo : UIImage
    let photo2 : UIImage
    let detail : String
}

struct AncientCities{
    let name : String
    let photo : UIImage
    let photo2 : UIImage
    let detail : String
}



struct SetDetails {
    let photo : UIImage
    let title : String
    let details : String
}

struct SetDetails2 {
    let photo : UIImage
    let title : String
    let details : String
}

struct SetDetails3 {
    let photo : UIImage
    let title : String
    let details : String
}
