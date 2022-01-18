//
//  Structs.swift
//  Wejhuh
//
//  Created by Huda N S on 15/05/1443 AH.
//

import Foundation
import UIKit


// MARK: - Structure of the collectionsView

// Discover
//-1
struct City {
    let name : String
    let photo : UIImage
    let photo2 : UIImage
    let detail : String
}

//-2
struct NaturalCities {
    let name : String
    let photo : UIImage
    let photo2 : UIImage
    let detail : String
}

//-3
struct AncientCities{
    let name : String
    let photo : UIImage
    let photo2 : UIImage
    let detail : String
}

//See
struct Event {
    let name : String
    let city : String
    let photo : String
    let photo2 : String
    let from : String
    let to : String
    let starting : String
    let ending : String
    let season : String
    let audince : String
    let eventDetalis : String
    let latitude : Double
    let longitude : Double
    
    
    
    // Fill in the array with data
    static func setSee(needToGetSelectedEvent: Bool,key:String?) -> [Event] {
        let FinalArray : [Event] = [
            Event(name: "WJ".localaized,
                                  city: "Jeddah".localaized,
                                  photo : "WJ",
                                  photo2: "WJ2" ,
                                  from: "4:00 PM",
                                  to: "12:00AM",
                                  starting: "3 OCT 2021",
                                  ending: "11 JAN 2021 ",
                                  season: "All Season".localaized,
                                  audince: "All".localaized,
                                  eventDetalis: "This development phase is the largest development phase of the Jeddah waterfront, and there are services and elements that have been added for the first time at the level of Jeddah waterfronts, equipped with services suitable for all groups and ages .. ".localaized ,
                                 latitude: 21.603058228054863 ,
                                 longitude: 39.107418758323526 ),
            Event(name: "Formula".localaized,
                                  city: "Jeddah".localaized,
                                  photo :  "Formula",
                                  photo2: "Formula2" ,
                                  from: "7:00 PM",
                                  to: "12 : 00 AM",
                                  starting: "1 Apr 2021",
                                  ending: "16 Apr 2021",
                                  season: "Jeddah season".localaized,
                                  audince: "Public".localaized,
                                  eventDetalis: "The Kingdom will host the first-ever Formula 1 Grand Prix in an international motor racing championship considered by many to be the most famous sporting event in the world .. If you are a fan of this type of racing and yearn for great times of suspense, excitement and challenge, all you have to do is tighten your belts and prepare for a special event in which the city of Jeddah will present what the world has never seen before !".localaized ,
                                  latitude: 21.633678655301924 ,
                                  longitude: 39.10363163177662),
            Event(name: "Athra".localaized,
                                  city: "Khobar".localaized,
                                  photo :  "Athra",
                                  photo2: "Athra2" ,
                                  from: "7:00 AM",
                                  to: "12:00 AM",
                                  starting: "1 Mar 2019",
                                  ending: "11 Oct 2022",
                                  season: "All season".localaized,
                                  audince: "Public".localaized,
                                  eventDetalis: "Ithra offers its visitors new and inspiring experiences that nurture creativity and a passion for learning, and enrich culture. Ithra is a beacon of change and a window to global experiences by encouraging creativity, inspiring minds, and empowering talent, and with the advancement of innovation and technology; The Kingdom of Saudi Arabia is keen to keep pace with this development at a harmonious pace ..".localaized ,
                                  latitude: 26.335647335413135 ,
                                  longitude: 50.12099148933118),
            Event(name: "Dakar Rally".localaized,
                                  city: "Around the country".localaized ,
                                  photo :"Dakar Rally",
                                  photo2: "Dakar2" ,
                                  from: "6:00 AM",
                                  to: "6:30 PM",
                                  starting: "1 Oct 2022",
                                  ending: "28 Oct 2022",
                                  season: "Jeddah season".localaized,
                                  audince: "All".localaized,
                                  eventDetalis: "The starting point will be from the Hail region, towards the capital, Riyadh, and the stop in Riyadh will be a one-day break, then the contestants will continue their challenge to the city of Jeddah .. This year's rally track will include two circuit stages in addition to a marathon stage ..".localaized ,
                                  latitude: 21.49290783847522 ,
                                  longitude: 39.20682789728205 ),
            Event(name: "Safari".localaized,
                                  city: "Riyadh".localaized,
                                  photo :  "Safari",
                                  photo2: "Safari2" ,
                                  from: "3:00 PM",
                                  to: "11:00 PM",
                                  starting: "12 Jan 2021",
                                  ending: "2 Feb 2021",
                                  season: "Riyadh season".localaized,
                                  audince: "All".localaized,
                                  eventDetalis: "Wildlife Center on your trip to Safari Nova, to see a variety of indigenous and exotic animals, such as hawks, owls, reptiles, jerboas and other wild animals, but the most prominent thing that will attract your attention and hold your breath is watching the leopard animals, which will charm your senses with its beauty and steal your heart with its gracefulness away from you In just a few steps ..".localaized ,
                                  latitude: 27.489123100759016 ,
                                  longitude: 41.73172966683947 ),
            Event(name: "Oasis".localaized,
                  city: "Riyadh".localaized,
                  photo : "Oasis",
                  photo2: "Oasis2" ,
                  from: "8:00 PM",
                  to: "2:00 AM",
                  starting: "12 Jan 2021",
                  ending: "3 Apr 2021", season: "Riyadh season".localaized,
                  audince: "All".localaized,
                  eventDetalis: "A luxury entertainment project in the heart of the desert north of Riyadh; It includes a variety of different activities and activities such as shopping, music, culture and sports, in addition to luxury camps that accommodate up to eight people ..".localaized,
                  latitude: 24.71400455067215 ,
                  longitude: 46.674639715560254 ),
            Event(name: "Combat Filed".localaized,
                                  city: "Riyadh".localaized,
                                  photo : "Combat Filed",
                                  photo2: "Combat Filed2",
                                  from: "4:00 PM",
                                  to: "2:00 AM",
                                  starting: "2 Dec 2021",
                                  ending: "1 Mar 2021",
                                  season: "Riyadh season".localaized,
                                  audince: "12 +",
                                  eventDetalis: "An amusement park that simulates war and combat games, here in Riyadh! Combat field is a world where you live the meaning of action and excitement, prove to us your shooting skills and your heart strength as you descend from the top of the zipline. Unmissable adventures between the details of different historical areas, watch live shows and live the life of a cowboy and fight your opponents in virtual reality ..".localaized ,
                                  latitude: 24.959885455123942 ,
                                  longitude: 46.797806847588795 ),
            Event(name: "MSC bellissima(Getaway.. Your Way)".localaized,
                                  city: "Jeddah".localaized,
                                  photo :  "MSC bellissima(Getaway.. Your Way)",
                                  photo2: "MSC2" ,
                                  from: "1 Nov 2021",
                                  to: "30 Mar 2021",
                                  starting: "6:00 PM",
                                  ending: "3:00 AM", season: "All Seasons".localaized,
                                  audince: "All".localaized,
                                  eventDetalis: "The cruise ship, which is owned and operated by MSC Cruises, can accommodate 4,500 passengers and has a crew of about 1,500 ..".localaized ,
                                  latitude: 24.079052099279078 ,
                                  longitude: 38.062143470095116)
        
        ]
        if needToGetSelectedEvent {
            var final: [Event] = []
            for event in FinalArray {
                if event.name == key {
                    final.append(event)
                }
            }
            return final
        }else {
            return FinalArray
        }
    }
}



//struct to put details for events
struct EventDetails {
    let photo : String
    let name : String
    let from : String
    let to : String
    let starting : String
    let ending : String
    let season : String
    let audince : String
    let overview : String
    let latitude : Double
    let longitude : Double
}

//Essental
struct Essental {
    var Title : String
    var photo : UIImage
    var dec : String
}

//struct to put details
struct SetDetails {
    let photo : UIImage
    let title : String
    let details : String
}

//struct for (UsefulContact)
struct UsefulContact {
    let title : String
    let number : String
}

// MARK: - class for user data
class User {
    var name:String?
    var email: String?
    var trips : [String]?
}


// MARK: - enum for Segues
enum Segues: String {
    case toProfile = "toProfile"
    case toOverviewOfTheSities = "toOverviewOfTheSities"
    case toEssentals = "toEssentals"
    case toSeeMore = "toSeeMore"
    case SafetyTravelTips = "SafetyTravelTips"
    case AboutVisa = "AboutVisa"
    case SaudiCurrency = "SaudiCurrency"
    case UNESCO = "UNESCO"
    case toApp = "toApp"
    case usefulContacts = "usefulContacts"
}


