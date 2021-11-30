//
//  Movie+CoreDataProperties.swift
//  Project_12
//
//  Created by Hasan Abuzayed on 11/28/21.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var year: Int16
    @NSManaged public var title: String?
    @NSManaged public var director: String?
}

extension Movie : Identifiable {

}
