
class ToDoListPresenter: ToDoListPresenterProtocol {
    
    weak var view: ToDoListViewProtocol?
    
    func presentData(data: [ToDo]) {
        
        let toDoVM = data.map {
            ToDoVM(
                id: $0.id,
                todo: $0.todo,
                completed: $0.completed,
                userId: $0.userId
            )
        }
        
        view?.displayData(data: toDoVM)
    }
    
    func presentError(description: String) {
        
        view?.displayError(description: description)
    }
}
