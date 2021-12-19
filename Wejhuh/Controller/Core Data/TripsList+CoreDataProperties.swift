//
//  TripsList+CoreDataProperties.swift
//  Wejhuh
//
//  Created by Huda N S on 14/05/1443 AH.
//
//

import Foundation
import CoreData


extension TripsList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TripsList> {
        return NSFetchRequest<TripsList>(entityName: "TripsList")
    }

    @NSManaged public var name: String?
    @NSManaged public var photo: String?

}

extension TripsList : Identifiable {

}
