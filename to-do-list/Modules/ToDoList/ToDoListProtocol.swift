import UIKit

protocol ToDoListViewProtocol: AnyObject {
    var interactor: ToDoListInteractorProtocol? { get set }
    var router: ToDoListRouterProtocol? { get set }
}

protocol ToDoListInteractorProtocol: AnyObject {
    var presenter: ToDoListPresenterProtocol? { get set }
}

protocol ToDoListPresenterProtocol: AnyObject {
    var view: ToDoListViewProtocol? { get set }
}

protocol ToDoListRouterProtocol: AnyObject {
    var view: ToDoListViewProtocol? { get set }
}

protocol BuilderProtocol: AnyObject {
    func build() -> UIViewController
}

