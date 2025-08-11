struct APIResponse: Decodable {
    
    let todos: [ToDoDTO]
    let total: Int
    let skip: Int
    let limit: Int
}
