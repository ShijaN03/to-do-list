import Foundation

class ToDoListInteractor: ToDoListInteractorProtocol {
    
    var apiService: APIServiceProtocol?
    var presenter: ToDoListPresenterProtocol?
    
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
                    
                    self.presenter?.presentData(data: toDo)
                }
                
            case .failure(let error):
                
                DispatchQueue.main.async {
                    
                    self.presenter?.presentError(description: error.localizedDescription)
                }
            }
            
        }
        
        
    }
    
}
