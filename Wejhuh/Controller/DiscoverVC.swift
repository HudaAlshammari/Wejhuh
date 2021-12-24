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
                              photo2: UIImage(named: "11")!,
                              detail: "Al-Soudah is a tourist village in the Asir region of the Kingdom of Saudi Arabia, 20 km from the city of Abha, at an altitude of 3015 meters above sea level, and its mountains are covered with dense juniper trees, forming beautiful natural forests .. Al-Soudah overlooks the Tihama region, so magnifying glasses have been installed in some of its parts as views to see the wonderful views of those valleys, valleys and neighboring villages located in the Tihama plains. The village records temperatures that do not exceed 15 degrees Celsius in the summer, while the temperatures in the winter are very low. Compared to the surrounding areas, the Al-Soudah tourist village was built, which includes a range of services, and the park was linked to the village of Rijal Alma in the Tihama region by cable car, which is about 40 km from Abha city .."))
        cityArray.append(City(name: "Al-Ula",
                              photo: UIImage(named: "Ula")!,
                              photo2: UIImage(named: "22")!,
                              detail: "Al-Ula is one of the cities of the Kingdom of Saudi Arabia, located in the northwest of the Kingdom, and administratively affiliated to the Emirate of Al-Madinah Al-Munawwarah region. It is approximately 300 km from the center of the Emirate in the north, and is the capital of Al-Ula Governorate. the reason for its name Al-Ula was that it had two famous eyes with fresh water, the Hanging and Ta'al, and on the source of the Hanging there were palm trees of high altitude called the Most High. The city of Al-Ula is located between two large mountains on a valley of fertile soil, where palms, citrus fruits and fruits are planted, and groundwater is available at close distances despite the great scarcity of rain. It is followed by about 300 villages."))
        cityArray.append(City(name: "Riyadh",
                              photo: UIImage(named: "Riyadh")!,
                              photo2: UIImage(named: "33")!,
                              detail: "Riyadh is the capital and largest city of the Kingdom of Saudi Arabia and the third largest Arab capital in terms of population. Riyadh is the most beautiful tourism city in Saudi Arabia. One of the restaurants that serve the most delicious types of food, in addition to being incubated with many tourist, recreational and historical places."))
        cityArray.append(City(name: "Al-Baha",
                              photo: UIImage(named: "Baha")!,
                              photo2: UIImage(named: "44")!,
                              detail: "Tourism in Al Baha will give you everything you wish for; With its picturesque nature, and its breathtaking beauty, with its towering mountains, deep valleys, and green forests.. Al-Baha is located in the southwest of the Kingdom of Saudi Arabia, between Abha and Taif. In addition to its enjoyment of many tourist attractions, you will not find more beautiful than Al-Baha parks, ancient villages, agricultural terraces, flowing waterfalls, in addition to many historical sites, and of course all modern tourist facilities, from resorts, cafes, and restaurants .."))
        cityArray.append(City(name: "Rijal Almae",
                              photo: UIImage(named: "Rijalalmae")!,
                              photo2: UIImage(named: "55")!,
                              detail: "The city of Rijal Alma’ enjoys the waterfalls of the village of Al-Sail, which is located to the south of the city, which contributed to the revival of the tourism sector in Rijal Alma’. The village of Rijal Alma’ is also distinguished as one of the most important and prominent tourist and natural places in Saudi Arabia. It is the best hiking places in the south of Saudi Arabia, attracting domestic and foreign tourists .."))
        cityArray.append(City(name: "Hail",
                              photo: UIImage(named: "Hail")!,
                              photo2: UIImage(named: "66")!,
                              detail: "Tourism in Hail is considered one of the most beautiful tourist places in Saudi Arabia, as it enjoys a moderate atmosphere and charming nature. It extends around the mountains, in the form of a beautiful arc, and is surrounded by many mountains from the east, west and north.. The city of Hail is located in the north of the Kingdom of Saudi Arabia, and is famous for its generosity and generosity, and it is called the “capital of dates.” The city of Hail has a variety of monuments and Thamudic inscriptions, and has two sites inscribed on the UNESCO World Heritage List. The city of Hail attracts many visitors and tourists, to enjoy its wonderful archaeological and tourist attractions."))
        cityArray.append(City(name: "Jeddah",
                              photo: UIImage(named: "Jeddah")!,
                              photo2: UIImage(named: "77")!,
                              detail: "Jeddah is one of the most beautiful cities in Saudi Arabia. It is called the Bride of the Red Sea in Saudi Arabia. It is the economic and tourist capital in the Kingdom. It has the largest sea port on the Red Sea. The city of Jeddah is famous for its towers and many skyscrapers, as well as many historical and modern tourist places."))
    }
    
    
    
    
    func setNaturalCities(){
        naturalCity.append(NaturalCities(name: "Asir",
                                         photo: UIImage(named: "3seer")!,
                                         photo2: UIImage(named: "88")!,
                                         detail: "The Asir region is characterized by its rainy weather, it is the ideal choice for a beautiful vacation during the months of September and October. With its cool climate and panoramic views, Asir is the right place to enjoy the outdoors and the magical places nature has to offer. Take the cable car to Jabal Al Akhdar, or as it is known as Jabal Dhurra, in the city of Abha, to enjoy the charming views around you. Or go on a trip to the Abha Dam, which combines the blue of the water and the green of the plants. Jabal Al-Sawda is also considered one of the most important destinations that attract visitors, as it is the highest peak in the Kingdom and part of the Sarawat mountain range .."))
        naturalCity.append(NaturalCities(name: "Hail",
                                         photo: UIImage(named: "hail2")!,
                                         photo2: UIImage(named: "99")!,
                                         detail: "Hail is one of the most famous and most beautiful tourist cities in Saudi Arabia, due to its beautiful and natural features. Among the most famous natural landmarks are the Aja and Salma Mountains, and the great Nafud desert. It is also characterized by its wonderful climate"))
        naturalCity.append(NaturalCities(name: "Al-Suwdah",
                                         photo: UIImage(named: "sudah2")!,
                                         photo2: UIImage(named: "10")!,
                                         detail: "One of the highest peaks in the Kingdom of Saudi Arabia is Jabal Al-Soudah, which is located within the Asir mountain range, and at an altitude of more than three thousand meters. Al-Soudah Tourist Village overlooks the natural area of Tihama, which has a picturesque pristine ecological scene, where rare juniper trees, forests, plateaus, valleys, and their natural life. The village embraces the clouds and is characterized by low temperatures throughout the year, and moderate rainfall constantly, which makes it one of the most beautiful tourist villages in Saudi Arabia .."))
        naturalCity.append(NaturalCities(name: "Abha",
                                         photo: UIImage(named: "abha")!,
                                         photo2: UIImage(named: "111")!,
                                         detail: "The city of Abha, where clouds and mountains embrace, and the rain washes it daily, and your hand touches its pure, cold mist, is the feeling of celebrating nature and its splendor.. Rain increases in the cities of Asir Tourism, as it has a role in attracting tourism in Asir, as it has the flavor of tourist enjoyment among visitors and vacationers of this region and the nature Breathtaking rain and clouds characterize this region and its tourist cities .."))
    }
    
    func setAncientCities(){
        ancientCity.append(AncientCities(name: "Riyadh",
                                         photo: UIImage(named: "R")!,
                                         photo2: UIImage(named: "rr")!,
                                         detail: "Despite the great development that the capital Riyadh is witnessing in all fields, especially the urban aspect, the historical and heritage sites that date back thousands of years are still preserved, as the historical sites in Riyadh and its suburbs vary between museums, palaces and markets. The Al-Masmak Palace dates back to more than 185 years, and the historic city of Diriyah is the city of “Al-Samoud” through which the Kingdom of Saudi Arabia was launched and was the capital in the first Saudi state. One of the beautiful sites in it is the Turaif neighborhood, which was the seat of the former government and one of the sites registered in the World Heritage and Al-Bujairi neighborhood as well. Also, Diriyah contains large antiquities and old houses made of “mud” .."))
        ancientCity.append(AncientCities(name: "Al-Ula",
                                         photo: UIImage(named: "O")!,
                                         photo2: UIImage(named: "oo")!,
                                         detail: "Al-Ula is the first site of the Kingdom of Saudi Arabia inscribed on the UNESCO World Heritage List. Spread over an area of ​​52 hectares, Mada'in Saleh was the principal southern city of the Nabataean kingdom, and consists of more than 100 well-preserved tombs, with elaborate facades cut from sandstone outcrops, surrounding the walled urban settlement. Recent studies indicate that Mada'in Saleh is the southernmost location in the Roman Empire .. In addition to Mada’in Saleh, Al-Ula is home to a series of fascinating historical and archaeological sites such as Al-Khuraybah (ancient Dadan), the capital of the Dedanese and Lihyanic kingdoms, which is today considered one of the most developed cities during the first millennium BC within the Arabian Peninsula, and thousands of examples of rock art and inscriptions The old Hejaz railway stations .."))
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
        performSegue(withIdentifier: Segues.toOverviewOfTheSities.rawValue , sender: nil)
    }
    
    
    @IBAction func profile(_ sender: UIButton) {
        performSegue(withIdentifier: Segues.toProfile.rawValue, sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.toOverviewOfTheSities.rawValue {
            
            let dest = segue.destination as! Discover
            dest.selectedSetData = selectedSetDetails
        }
    }
}





