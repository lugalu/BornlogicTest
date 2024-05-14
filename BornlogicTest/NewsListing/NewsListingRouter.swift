//Created by Lugalu on 13/05/24.

import Foundation

class NewsListingRouter: NewsListingRouterProtocol {
    var view: NewsListingControllerProtocol?
    
    static func getRouter(service: NetworkProtocol = NetworkService.shared) -> NewsListingRouterProtocol {
        let router = NewsListingRouter()
        
        let view: NewsListingControllerProtocol = NewsListViewController()
        var interactor: NewsListingInteractorProtocol = NewsListingInteractor()
        var presenter: NewsListingPresenterProtocol = NewsListingPresenter()
        
        router.view = view
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        interactor.service = service
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return router        
    }
    
    func getView() -> NewsListingControllerProtocol? {
        return view
    }
    
    func navigateToArticle() {
        //TODO: Open page!
    }
    
    
}
