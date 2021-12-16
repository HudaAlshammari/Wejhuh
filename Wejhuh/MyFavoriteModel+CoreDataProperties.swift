//
//  MyFavoriteModel+CoreDataProperties.swift
//  Wejhuh
//
//  Created by Huda N S on 12/05/1443 AH.
//
//

import Foundation
import CoreData


extension MyFavoriteModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyFavoriteModel> {
        return NSFetchRequest<MyFavoriteModel>(entityName: "MyFavoriteModel")
    }

    @NSManaged public var name: String?
    @NSManaged public var photo: String?

}

extension MyFavoriteModel : Identifiable {

}
