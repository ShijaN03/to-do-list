import Foundation

struct TaskModel {
    let id: Int64
    var title: String
    var details: String?
    var createdAt: Date
    var isCompleted: Bool
    var userId: Int64
}
