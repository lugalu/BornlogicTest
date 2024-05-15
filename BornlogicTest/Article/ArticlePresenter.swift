//Created by Lugalu on 14/05/24.

import UIKit

class ArticlePresenter: ArticlePresenterProtocol{
  
    
    var view: ArticleControllerProtocol?
    var interactor: ArticleInteractorProtocol?
    var router: ArticleRouterProtocol?
    var content: NewsEntity?
    
    func requestImage() async throws -> UIImage? {
        guard let url = content?.urlToImage else {
            return nil
        }
        return try? await interactor?.downloadImage(url: url)
    }
    
    
}
