//Created by Lugalu on 13/05/24.

import UIKit

class NewsListingPresenter: NewsListingPresenterProtocol {
    var view: NewsListingControllerProtocol?
    var interactor: NewsListingInteractorProtocol?
    var router: NewsListingRouterProtocol?
    
    var news: Array<NewsEntity> = []
    
    
    func navigateToArticle(index: Int) {
        guard news.count > index else { return }
        router?.navigateToArticle(news: news[index])
    }
    
    func requestContent() {
        interactor?.makeNewsRequest()
    }
    
    func requestImages(){
        Task(priority: .background){[weak self] in
            let _ = await withTaskGroup(of: Int.self){ [weak self] group in
                guard let self else { return -1 }
                for i in 0..<self.news.count{
                    guard let url = news[i].urlToImage else { continue }
                    group.addTask{
                        let image = try? await self.interactor?.makeImageRequests(url: url)
                        self.news[i].image = image
                        return 1
                    }
                    
                }
                return 1
            }
            try? await Task.sleep(nanoseconds: 1000000000)
            self?.news[1].image = UIImage(named: "Bird")
            DispatchQueue.main.async {  [weak self] in
                self?.view?.reloadCells()
            }
        }
    }
    
    func finishedDowloading(_ content: [NewsEntity]) {
        guard !content.isEmpty else {
            self.failedToDownloadNews()
            return
        }
        self.news = content
        self.view?.updateViewContent()
        self.requestImages()
    }
    
    func failedToDownloadNews() {
        view?.showErrorAlert()
    }
    
}


