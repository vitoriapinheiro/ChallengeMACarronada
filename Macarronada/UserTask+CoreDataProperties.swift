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
    @NSManaged public var time: Int
    @NSManaged public var title: String?
    @NSManaged public var status: String?
    
    var wrappedID: UUID { id! }
    var wrappedTitle: String { title ?? "" }
    var wrappedTime: Int { time }
    var wrappedStatus: String { status ?? "" }
}

extension UserTask : Identifiable {

}
