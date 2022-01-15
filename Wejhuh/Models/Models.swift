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


