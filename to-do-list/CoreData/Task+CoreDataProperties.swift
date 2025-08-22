

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var details: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var userId: Int64

}

extension Task : Identifiable {

}
