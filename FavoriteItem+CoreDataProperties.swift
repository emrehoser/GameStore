//
//  FavoriteItem+CoreDataProperties.swift
//  GameStore
//
//  Created by Hamza IŞIKTAŞ on 24.03.2021.
//
//

import Foundation
import CoreData


extension FavoriteItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteItem> {
        return NSFetchRequest<FavoriteItem>(entityName: "FavoriteItem")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var imageurl: String?
    @NSManaged public var metacritic: String?
    @NSManaged public var genres: [Genre]?

}

extension FavoriteItem : Identifiable {

}
