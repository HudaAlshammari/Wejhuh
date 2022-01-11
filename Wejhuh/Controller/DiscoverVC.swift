//
//  ViewController.swift
//  Wejhuh
//
//  Created by Huda N S on 02/05/1443 AH.
//

import UIKit

class DiscoverVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    
    // MARK: - CollectionsView of the Discover
    
    // Outlet of CollectionView
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet var naturalCities: UICollectionView!
    @IBOutlet weak var ancientCities: UICollectionView!
    
    
    //Variable to fill in details
    var selectedSetDetails : SetDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Formats for CollectionView
        homeCollectionView.backgroundColor = UIColor.clear
        naturalCities.backgroundColor = UIColor.clear
        ancientCities.backgroundColor = UIColor.clear
        ancientCities.delegate = self
        ancientCities.dataSource = self
        setCity()
        setNaturalCities()
        setAncientCities()
    }
    
    //Arrays of pictures, names and details
    var cityArray = [City]()
    var naturalCity = [NaturalCities]()
    var ancientCity = [AncientCities]()

    
    // MARK: - Fill in the arrays with data
    
    //First Array :
    func setCity(){
        cityArray.append(City(name: "Al-Suwdah".localaized ,
                              photo: UIImage(named: "sudah")!,
                              photo2: UIImage(named: "sudah2")!,
                              detail: "Jabal Al-Soudah Abha is the highest mountain peak in the Kingdom that combines the magic of place and time. God has blessed him with a beautiful nature, amazing views, and unparalleled beauty. Its height is 3015 meters above sea level, and it is covered with dense forests of juniper trees that add to its splendor. The magic makes it the most famous tourist attraction in Abha .. \nAl-Soudah Abha is also characterized by moderate weather throughout the year, where temperatures during the summer reach 15 degrees Celsius, accompanied by rain in August. Therefore, Jabal Al-Soudah is one of the most prominent tourist attractions in Saudi Arabia, and it attracts a huge number of visitors, both from inside and outside the Kingdom .. \n\nBEST ACTIVITIES : \n\n- Residential hotels \n- Chairlifts \n- Entertainment games \n- Glide \n- Residential Resorts.".localaized))
        
        cityArray.append(City(name: "Al-Ula".localaized,
                              photo: UIImage(named: "Ula")!,
                              photo2: UIImage(named: "Ula2")!,
                              detail: "A great historical heritage..and charming nature and perfect weather, especially in winter. \nThe city of Al-Ula is one of the most important international tourist destinations because of its beautiful natural components, and the diversity of history and antiquities that go back to the back. Thousands of years ago, UNESCO registered the archaeological site of Al-Hajar in Al-Ula Governorate on the World Heritage List, thus becoming the first Saudi archaeological site to be inscribed on the World Heritage List .. It is characterized by a pleasant climate, especially in winter .. \n\nBEST ACTIVITIES : \n\n- Sea tripes \n- Air flights \n- Singing concerts and shows \n- Entertainment and games \n- Camping \n- Enrichment trips \n- Visiting Elephant Mountain \n- Dadan and Jabal Ikma tour \n- Star gazing experience".localaized))
        cityArray.append(City(name: "Riyadh".localaized,
                              photo: UIImage(named: "Riyadh")!,
                              photo2: UIImage(named: "Riyadh2")!,
                              detail: "Riyadh is the capital and largest city in the Kingdom of Saudi Arabia \nand the third largest Arab capital in terms of population.\nRiyadh is the most beautiful tourist city in the Kingdom of Saudi Arabia.\nOne of the restaurants that serve the most delicious types of food, in addition to hosting many tourist, recreational and historical places .. in addition to The luxurious accommodation provided by the city to its guests ..\nIn Riyadh, you can find ancient historical sites, wonderful museums, picturesque parks, and fun recreational places suitable for family tourism, as well as you can shop in the most luxurious malls \n\nBEST ACTIVITIES : \n\n- Stock field \n- Zoo \n- A wide street surrounded by trees \n- Campat Field \n- Camping \n- Paragliding \n- The shopping".localaized))
        cityArray.append(City(name: "Al-Baha".localaized,
                              photo: UIImage(named: "Baha")!,
                              photo2: UIImage(named: "Baha2")!,
                              detail: "Tourism in Al Baha will give you everything you wish for; With its picturesque nature, scenic beauty, high mountains, deep valleys, and green forests ..\nAl Baha is located in the southwest of the Kingdom of Saudi Arabia, between Abha and Taif.\nIn addition to enjoying many tourist attractions, you will not find more beautiful than Al Baha parks, ancient villages, agricultural terraces, flowing waterfalls, in addition to many historical sites, and of course all modern tourist facilities, from resorts, cafes and restaurants ..\nAl Baha is also characterized by its beautiful climate and continuous rain .. \n\nBEST ACTIVITIES : \n\n- Residential hotels \n- Chairlifts \n- Entertainment games \n- Glide \n- Residential Resorts".localaized))
        cityArray.append(City(name: "Rijal Almae".localaized,
                              photo: UIImage(named: "Rijalalmae")!,
                              photo2: UIImage(named: "Rijalalmae2")!,
                              detail: "The city of Rijal Almae enjoys the waterfalls of the village of Al-Sail, which is located to the south of the city, which contributed to the recovery of the tourism sector in Rijal Almae .. \nThe village of Rijal is also distinguished as one of the most important and prominent tourist and natural places in the Kingdom of Saudi Arabia ..\nIt is the best hiking place in the south of Saudi Arabia, where it attracts local and foreign tourists .. It is also characterized by its beautiful climate ..\nTourism in Rijal Alma is characterized by the presence of many parks and their ancient monuments dating back thousands of years that are not found anywhere in the world such as the trees of brilliance .. \nIn this article we have learned about the nature of tourism in Rijal Almae .. \n\nBEST ACTIVITIES : \n\n- Singing concerts and shows \n- Camping \n- Chairlifts \n- Enrichment trips".localaized))
        cityArray.append(City(name: "Hail".localaized,
                              photo: UIImage(named: "Hail")!,
                              photo2: UIImage(named: "Hail2")!,
                              detail: "Tourism in Hail is considered one of the most beautiful tourist places in the Kingdom of Saudi Arabia, as it enjoys a moderate atmosphere and a charming nature ..\nIt extends around the mountains in the form of a beautiful arc, and is surrounded by many mountains from the east, west and north ..\nThe city of Hail is located in the north of the Kingdom of Saudi Arabia, and is famous It has generosity and generosity and is called the (capital of dates) ..\nThe city of Hail includes a variety of monuments and inscriptions, and has two sites included in the UNESCO World Heritage List ..\nThe city of Hail attracts many visitors and tourists, to enjoy its wonderful archaeological and tourist areas .. \n\nBEST ACTIVITIES : \n\n- Sahara Desert \n- Camping \n- Paragliding \n- contemplate the tall mountains \n- Rallies".localaized))
        cityArray.append(City(name: "Jeddah".localaized,
                              photo: UIImage(named: "Jeddah")!,
                              photo2: UIImage(named: "Jeddah2")!,
                              detail: "Jeddah is one of the most beautiful cities in the Kingdom of Saudi Arabia .. It is called the Bride of the Red Sea in the Kingdom of Saudi Arabia. It is the economic and tourist capital of the Kingdom. It has the largest sea port on the Red Sea. The city of Jeddah is famous for its towers and many skyscrapers, as well as many historical and modern tourist places .. The city of Jeddah is one of the first tourist cities in the Kingdom and is the oldest in civilization .. It is characterized by luxury hotels, restaurants and cafes .. It has many luxurious and distinctive markets \n\nBEST ACTIVITIES : \n\n- King Fahad's fountain \n- Jeddah Oasis for Entertainment Sciences  \n- Iceland amusement park \n- Fakih Aquarium \n- Desert sea divers \n- Sail island \n- Al Shallal Amusement Park \n- Water park".localaized))
    }
    
    
    //Sacned Array :
    func setNaturalCities(){
        naturalCity.append(NaturalCities(name: "Asir".localaized,
                                         photo: UIImage(named: "3seer")!,
                                         photo2: UIImage(named: "3seer2")!,
                                         detail: "Nature in Asir .. \n\nThe Asir region is characterized by its rainy weather, it is the perfect choice for a beautiful vacation during the months of September and October..\nWith its cool climate and panoramic views, Asir is the right place to enjoy the outdoors and the magical places that nature provides. Take the cable car to Jabal Al Akhdar to enjoy the charming views around you..\nor go on a trip to the Abha Dam, which combines the blueness of water and greenery of the plants..\nMount Montenegro is also one of the most important destinations that attract visitors, it is the highest peak in the kingdom\n n and part of the Sarawat mountain range..\nBecause Asir region always stands by nature, the scenery changes every day according to \nlight, wind or rain, as the landscape of the earth changes from \nshiny glowing on clear days\n to humid and refreshing After the rain,\nand the air tends\nto cool at the top up the \nwinding roads around \nthe mountains.."))
        naturalCity.append(NaturalCities(name: "Hail",
                                         photo: UIImage(named: "Hail3")!,
                                         photo2: UIImage(named: "Hail4")!,
                                         detail: "Nature in Hail .. \n\nHail is one of the most famous and most beautiful tourist cities \nin the Kingdom of Saudi Arabia, \ndue to its beauty and nature .. \nAmong the most famous natural attractions are the mountains of Aja and Salma \nand the great Nafud desert .. \nIt is also characterized by its wonderful climate .. \nand (Aqeedat Hail), the most famous tourist village in Hail .. \nIt was the main destination for visitors and tourists on all occasions as it was a major sign and was widely known outside Hail for its beautiful tourist atmosphere .. \nThe Araf castle, is one of the historical castles \nin the Kingdom of Saudi Arabia \nand the King of Saudi Arabia, \nrenovated it because it was the \nonly place, from which \nscholars could see The crescent \nof the blessed month \nof Ramadan"))
//        naturalCity.append(NaturalCities(name: "Al-Suwdah",
//                                         photo: UIImage(named: "sudah3")!,
//                                         photo2: UIImage(named: "sudah4")!,
//                                         detail: "One of the highest peaks in the Kingdom of Saudi Arabia is Jabal Al-Soudah, which is located within the Asir mountain range, and at an altitude of more than three thousand meters. Al-Soudah Tourist Village overlooks the natural area of Tihama, which has a picturesque pristine ecological scene, where rare juniper trees, forests, plateaus, valleys, and their natural life. The village embraces the clouds and is characterized by low temperatures throughout the year, and moderate rainfall constantly, which makes it one of the most beautiful tourist villages in Saudi Arabia .."))
        naturalCity.append(NaturalCities(name: "Abha",
                                         photo: UIImage(named: "abha")!,
                                         photo2: UIImage(named: "abha2")!,
                                         detail: "Nature in Abha .. \n\nThe city of Abha, where clouds \nand mountains embrace, and the rain washes it every day, and your hand touches its cool, \npure mist, you feel the celebration of nature and its splendor.. \nRains are increasing in the tourist cities of Asir, as they are .. \nIt has a role in attracting tourism in Asir \nbecause of its flavor of tourist pleasure among \nvisitors to this region and vacationers, and the picturesque nature, rain and clouds that characterize this region and its tourist cities.. It is one of the most beautiful tourist attractions in Abha thanks to its picturesque nature, where the clear water flows almost permanently over Granite stones covered with juniper, acacia and water moss plants, \nmaking the place as a whole an imaginary \nspot for photography and recreation \nenthusiasts .. If you are a fan \nof green medicine, \ndazzling mountain views \nand a waterfall, or moving \nbetween archaeological sites \nand commercial markets, \nthere is no doubt that \ntourism in Abha is the best \ndestination for you."))
    }
    
    // Third Array :
    func setAncientCities(){
        ancientCity.append(AncientCities(name: "Riyadh",
                                         photo: UIImage(named: "Riyadh3")!,
                                         photo2: UIImage(named: "Riyadh4")!,
                                         detail: "Despite the great development \nthat the capital Riyadh \nis witnessing in all fields, especially the urban aspect, \nthe historical and heritage sites that date back thousands of years are still preserved, as the historical sites in Riyadh \nand its suburbs vary between museums, palaces and markets .. \nThe Al-Masmak Palace dates back to more than 185 years, \nand the historic city of Diriyah is the city \nof “Al-Samoud” through which the \nKingdom of Saudi Arabia was launched \nand was the capital in the first Saudi state .. \nOne of the beautiful sites in it is the Turaif neighborhood,\nwhich was the seat of the former government \nand one of the sites registered in the World \nHeritage and Al-Bujairi \nneighborhood as well .. \nAlso, Diriyah contains large antiquities \nand old houses made of “mud” .."))
        ancientCity.append(AncientCities(name: "Al-Ula",
                                         photo: UIImage(named: "Ula3")!,
                                         photo2: UIImage(named: "Ula4")!,
                                         detail: "Al-Ula is the first site of the Kingdom of Saudi Arabia \ninscribed on the UNESCO World Heritage List .. \nSpread over an area of ​​52 hectares, \nMada'in Saleh was the principal \nsouthern city of the Nabataean kingdom, \nand consists of more than 100 well-preserved tombs, with elaborate \nfacades cut from sandstone outcrops, surrounding the walled urban settlement .. \nRecent studies indicate that Mada'in Saleh is the southernmost location in the Roman Empire .. \nIn addition to Mada’in Saleh, Al-Ula is home to a series of fascinating historical \nand archaeological sites such as Al-Khuraybah (ancient Dadan) the capital of the Dedanese \nand Lihyanic kingdoms, which is today considered \none of the most developed \ncities during the first \nmillennium BC within the \nArabian Peninsula, \nand thousands of examples \nof rock art \nand inscriptions The old \nHejaz railway stations .."))
    }
    
    
    // MARK: - functions
    
    //function to determine the number of rows of an array
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == homeCollectionView ){
            return cityArray.count
        }else if (collectionView == naturalCities ){
            return naturalCity.count
        }else{
            return ancientCity.count
        }
    }
    
    //function to select the elements of an array
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == naturalCities){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NaturalCitiesCell
            let data = naturalCity[indexPath.row]
            cell.setupCell(photo: data.photo, name: data.name)
            return cell
            
        } else if (collectionView == homeCollectionView ){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! DiscoverCell
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
    
    //function that is didSelect on the cells
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
    
    // prepare segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.toOverviewOfTheSities.rawValue {
            let dest = segue.destination as! Discover
            dest.selectedSetData = selectedSetDetails
        }
    }
    
    // MARK: - button
    
    //button for go to profile
    @IBAction func profileButton(_ sender: Any) {
        performSegue(withIdentifier: Segues.toProfile.rawValue, sender: nil)
    }
}
