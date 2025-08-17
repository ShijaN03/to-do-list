import UIKit

final class ToDoListBuilder: BuilderProtocol {
    
    static func build() -> UIViewController {
        
        let view = ToDoListView()
        let presenter = ToDoListPresenter()
        let interactor = ToDoListInteractor()
        let router = ToDoListRouter()
        
        let apiService = APIService()
        
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        interactor.apiService = apiService
        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
}
