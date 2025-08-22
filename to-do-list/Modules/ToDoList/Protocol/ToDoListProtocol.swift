import UIKit

protocol ToDoListViewProtocol: AnyObject {
    func reload()
    func displayError(description: String)
}

protocol ToDoListPresenterProtocol: AnyObject {
    var toDo: [ToDoVM] { get set }
    func numberOfRows() -> Int
    func viewDidLoad()
}

protocol ToDoListInteractorInputProtocol: AnyObject {
    func fetchData()
}

protocol ToDoListInteractorOutputProtocol: AnyObject {
    func didFetch(data: [ToDo])
    func didFail(error: Error)
}

protocol ToDoListRouterProtocol: AnyObject {
    
}
