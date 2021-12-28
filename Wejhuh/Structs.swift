//
//  Structs.swift
//  Wejhuh
//
//  Created by Huda N S on 15/05/1443 AH.
//

import Foundation
import UIKit


// MARK: - Structure of cities in the view (discover)
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
//struct to put details
struct SetDetails {
    let photo : UIImage
    let title : String
    let details : String
}

struct Event {
    let name : String
    let city : String
    let photo : String
}



// MARK: - Struct for user data
class User {
    var name:String?
    var email: String?
    var trips : [String]?
}




enum Segues: String {
    case toProfile = "toProfile"
    case toOverviewOfTheSities = "toOverviewOfTheSities"
    case toEssentals = "toEssentals"
    case toSeeMore = "toSeeMore"
}


