import UIKit

final class ToDoListBuilder: BuilderProtocol {
    
    static func build() -> UIViewController {
        
        let apiService = APIService()
        let repo = CoreDataRepository()
        
        let view = ToDoListView()
        let presenter = ToDoListPresenter()
        let interactor = ToDoListInteractor(apiService: apiService, repo: repo)
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
