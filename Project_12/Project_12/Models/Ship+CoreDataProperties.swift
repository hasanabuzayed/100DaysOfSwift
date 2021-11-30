//
//  Ship+CoreDataProperties.swift
//  Project_12
//
//  Created by Hasan Abuzayed on 11/28/21.
//
//

import Foundation
import CoreData


extension Ship {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ship> {
        return NSFetchRequest<Ship>(entityName: "Ship")
    }

    @NSManaged public var name: String?
    @NSManaged public var universe: String?

}

extension Ship : Identifiable {

}
