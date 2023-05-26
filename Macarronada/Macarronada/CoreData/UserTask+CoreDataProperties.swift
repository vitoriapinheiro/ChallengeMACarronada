//
//  UserTask+CoreDataProperties.swift
//  Macarronada
//
//  Created by vivi on 25/05/23.
//
//

import Foundation
import CoreData


extension UserTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserTask> {
        return NSFetchRequest<UserTask>(entityName: "UserTask")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var time: Double

}

extension UserTask : Identifiable {

}
