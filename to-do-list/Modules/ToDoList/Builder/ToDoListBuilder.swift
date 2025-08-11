import UIKit

final class ToDoListBuilder: BuilderProtocol {
    
    func build() -> UIViewController {
        
        let view: ToDoListViewProtocol & UIViewController = ToDoListView()
        let presenter: ToDoListPresenterProtocol = ToDoListPresenter()
        let interactor: ToDoListInteractorProtocol = ToDoListInteractor()
        let router: ToDoListRouterProtocol = ToDoListRouter()
        
        view.interactor = interactor
        view.router = router
        
        interactor.presenter = presenter
        
        presenter.view = view
        
        router.view = view
        
        return view
    }
}
