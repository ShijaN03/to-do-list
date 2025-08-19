import UIKit

protocol ToDoListViewProtocol: AnyObject {
    func displayData(data: [ToDoVM])
    func displayError(description: String)
}

protocol ToDoListPresenterProtocol: AnyObject {
    var toDo: [ToDoVM] { get set }
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
