//Created by Lugalu on 14/05/24.

import UIKit

class ArticleRouter: ArticleRouterProtocol{
    var view: ArticleControllerProtocol?
    
    private init(){}
    
    static func getRouter(news: NewsEntity) -> ArticleRouterProtocol {
        var router: ArticleRouterProtocol = ArticleRouter()
        
        let view: ArticleControllerProtocol = ArticleViewController()
        var presenter: ArticlePresenterProtocol = ArticlePresenter()
        var interactor: ArticleInteractorProtocol = ArticleInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.content = news
        
        router.view = view
        
        return router
    }
    
    func getView() -> ArticleControllerProtocol? {
        return view
    }
    
    
}
