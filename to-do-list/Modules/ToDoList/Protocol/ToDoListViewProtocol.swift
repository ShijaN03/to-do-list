import UIKit

protocol ToDoListViewProtocol: AnyObject {
    
    var interactor: ToDoListInteractorProtocol? { get set }
    var router: ToDoListRouterProtocol? { get set }
    
    func displayData(data: [ToDoVM])
    func displayError(description: String)
    
}

protocol ToDoListInteractorProtocol: AnyObject {
    
    var apiService: APIServiceProtocol? { get set }
    var presenter: ToDoListPresenterProtocol? { get set }
    
    func fetchData()
}

protocol ToDoListPresenterProtocol: AnyObject {
    
    var view: ToDoListViewProtocol? { get set }
    
    func presentData(data: [ToDo])
    func presentError(description: String)
}

protocol ToDoListRouterProtocol: AnyObject {
    
    var view: ToDoListViewProtocol? { get set }
}

protocol BuilderProtocol: AnyObject {
    
    static func build() -> UIViewController
}


