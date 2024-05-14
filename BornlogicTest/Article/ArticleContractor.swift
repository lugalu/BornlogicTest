//Created by Lugalu on 14/05/24.

import UIKit

protocol ArticleControllerProtocol: UIViewController {
    var presenter: ArticlePresenterProtocol? {get set}

}

protocol ArticleRouterProtocol {
    var view: ArticleControllerProtocol? {get set}
    static func getRouter(news: NewsEntity) -> ArticleRouterProtocol
    
    func getView() -> ArticleControllerProtocol?
}

protocol ArticlePresenterProtocol {
    var view: ArticleControllerProtocol? {get set}
    var interactor: ArticleInteractorProtocol? {get set}
    var router: ArticleRouterProtocol? {get set}
    var content: NewsEntity? {get set}
    

}

protocol ArticleInteractorProtocol {
    var presenter: ArticlePresenterProtocol? {get set}
    
}


