import UIKit

final class ToDoListBuilder: BuilderProtocol {
    
    static func build() -> UIViewController {
        
        let apiService = APIService()
        
        let view = ToDoListView()
        let presenter = ToDoListPresenter()
        let interactor = ToDoListInteractor(apiService: apiService)
        let router = ToDoListRouter()
        
        
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
