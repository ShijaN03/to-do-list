import UIKit

final class ToDoListBuilder: BuilderProtocol {
    
    static func build() -> UIViewController {
        
        let apiService: APIServiceProtocol = APIService()
        let view: ToDoListViewProtocol & UIViewController = ToDoListView()
        let presenter: ToDoListPresenterProtocol = ToDoListPresenter()
        let interactor: ToDoListInteractorProtocol = ToDoListInteractor()
        let router: ToDoListRouterProtocol = ToDoListRouter()
        
        view.interactor = interactor
        view.router = router
        
        interactor.apiService = apiService
        interactor.presenter = presenter
        
        presenter.view = view
        
        router.view = view
        
        return view
    }
}
