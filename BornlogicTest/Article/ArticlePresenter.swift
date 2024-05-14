//Created by Lugalu on 14/05/24.

import Foundation

class ArticlePresenter: ArticlePresenterProtocol{
    var view: ArticleControllerProtocol?
    var interactor: ArticleInteractorProtocol?
    var router: ArticleRouterProtocol?
    var content: NewsEntity?
    
    
}
