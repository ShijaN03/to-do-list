import Foundation

final class ToDoListPresenter {

    weak var view: ToDoListViewProtocol?
    var interactor: ToDoListInteractorInputProtocol?
    var router: ToDoListRouterProtocol?
    
    var toDo: [ToDoVM] = []

}

extension ToDoListPresenter: ToDoListPresenterProtocol {
    
    func numberOfRows() -> Int {
        return toDo.count
    }
    
    func viewDidLoad() {
        
        interactor?.fetchData()
    }
    
    
    
}

extension ToDoListPresenter: ToDoListInteractorOutputProtocol {
    
    func didFetch(data: [ToDo]) {
        
        let toDoVM = data.map {
            ToDoVM(
                id: $0.id,
                title: $0.title,
                createdAt: $0.createdAt,
                isCompleted: $0.isCompleted,
                userId: $0.userId)
        }
        
        self.toDo = toDoVM
        
        DispatchQueue.main.async {
            
            self.view?.reload()
        }
    }
    
    func didFail(error: Error) {
        
        DispatchQueue.main.async {
            self.view?.displayError(description: error.localizedDescription)
            self.view?.reload()
        }
    }
    
    
}

