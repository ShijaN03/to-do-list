import Foundation

final class ToDoListPresenter {

    weak var view: ToDoListViewProtocol?
    var interactor: ToDoListInteractorInputProtocol?
    var router: ToDoListRouterProtocol?
    
    var toDo: [ToDoVM] = []

}

extension ToDoListPresenter: ToDoListPresenterProtocol {
    
    func viewDidLoad() {
        
        interactor?.fetchData()
    }
    
    
    
}

extension ToDoListPresenter: ToDoListInteractorOutputProtocol {
    
    func didFetch(data: [ToDo]) {
        
        let toDoVM = data.map {
            ToDoVM(
                id: $0.id,
                todo: $0.todo,
                completed: $0.completed,
                userId: $0.userId
            )
        }
        
        self.toDo = toDoVM
        
        DispatchQueue.main.async {
            self.view?.displayData(data: toDoVM)
            self.view
        }
    }
    
    func didFail(error: Error) {
        
        DispatchQueue.main.async {
            self.view?.displayError(description: error.localizedDescription)
        }
    }
    
    
}

