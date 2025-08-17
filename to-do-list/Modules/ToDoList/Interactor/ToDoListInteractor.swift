import Foundation

class ToDoListInteractor: ToDoListInteractorInputProtocol {
    
    var apiService: APIServiceProtocol?
    weak var presenter: ToDoListInteractorOutputProtocol?
    
    func fetchData() {
        
        self.apiService?.fetchData { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                
                let toDo: [ToDo] = response.todos.map {
                    ToDo(
                        id: $0.id,
                        todo: $0.todo,
                        completed: $0.completed,
                        userId: $0.userId
                    )
                }
                
                DispatchQueue.main.async {
                    
                    
                }
                
            case .failure(let error):
                
                DispatchQueue.main.async {
                    
                    
                }
            }
            
        }
        
        
    }
    
}
