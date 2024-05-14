//Created by Lugalu on 13/05/24.

import UIKit

class NewsListingPresenter: NewsListingPresenterProtocol {
    var view: NewsListingControllerProtocol?
    var interactor: NewsListingInteractorProtocol?
    var router: NewsListingRouterProtocol?
    
    var news: Array<NewsEntity> = []
    
    func requestContent() {
        interactor?.makeNewsRequest()
    }
    
    func requestImage(for index: IndexPath){
        guard index.row < news.count,
              news[index.row].image == nil,
            let url = news[index.row].urlToImage else {
            return
        }
        interactor?
            .makeImageRequests(url: url, indexPath: index )
    }
    
    func finishedDowloading(_ content: [NewsEntity]) {
        guard !content.isEmpty else {
            self.failedToDownloadNews()
            return
        }
        self.news = content
        self.view?.updateViewContent()
    }
    
    func finishedDowloading(image: UIImage?, forCell index: IndexPath) {
        
        guard let image = image else {
            return
        }
        
        news[index.row].image = image
        view?.reloadCell(index: index)
    }
  
    
    func failedToDownloadNews() {
        view?.showErrorAlert()
    }
    
}


