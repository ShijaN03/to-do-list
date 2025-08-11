struct ToDoDTO: Decodable, Sendable {
    
    let id: Int
    let todo: String
    let completed: Bool
    let userId: Int
}
