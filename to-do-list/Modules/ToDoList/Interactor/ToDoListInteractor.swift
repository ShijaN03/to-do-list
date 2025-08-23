import Foundation

final class ToDoListInteractor: ToDoListInteractorInputProtocol {
    
    var apiService: APIServiceProtocol
    let repo: CoreDataRepositoryProtocol
    weak var presenter: ToDoListInteractorOutputProtocol?
    
    init(apiService: APIServiceProtocol, repo: CoreDataRepositoryProtocol) {
        
        self.apiService = apiService
        self.repo = repo
    }
    
    func fetchData() {
        
        self.apiService.fetchData { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success(let response):
                
                let toDo: [ToDo] = response.todos.map {
                    ToDo(
                        id: $0.id,
                        title: $0.todo,
                        createdAt: Date(),
                        isCompleted: $0.completed,
                        userId: $0.userId)
                    
                }
                
                self.presenter?.didFetch(data: toDo)
                
            case .failure(let error):
                
                self.presenter?.didFail(error: error)
                
            }
        }
    }
}
