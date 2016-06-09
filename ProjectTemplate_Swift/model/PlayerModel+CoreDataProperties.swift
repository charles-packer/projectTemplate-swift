//
//  PlayerModel+CoreDataProperties.swift
//  
//
//  Created by charles_packer on 6/9/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension PlayerModel {

    @NSManaged var fullName: String?
    @NSManaged var playerID: String?
    @NSManaged var position: String?
    @NSManaged var projectedScore: NSNumber?
    @NSManaged var projectedValue: NSNumber?

}
