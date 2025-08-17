
class ToDoListPresenter: ToDoListPresenterProtocol, ToDoListInteractorOutputProtocol {

    weak var view: ToDoListViewProtocol?
    var interactor: ToDoListInteractorInputProtocol?
    var router: (any ToDoListRouterProtocol)?
    
    func presentData(data: [ToDo]) {
        
        let toDoVM = data.map {
            ToDoVM(
                id: $0.id,
                todo: $0.todo,
                completed: $0.completed,
                userId: $0.userId
            )
        }
        
        
    }
    
    func presentError(description: String) {
        
        
    }
}
