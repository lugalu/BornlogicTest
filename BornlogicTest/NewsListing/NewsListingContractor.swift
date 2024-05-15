//Created by Lugalu on 13/05/24.

import UIKit

protocol NewsListingControllerProtocol: UIViewController {
    var presenter: NewsListingPresenterProtocol? {get set}
    
    func updateViewContent()
    func showErrorAlert()
    func reloadCells()
}

protocol NewsListingRouterProtocol {
    var view: NewsListingControllerProtocol? {get set}
    static func getRouter(service: NetworkProtocol) -> NewsListingRouterProtocol
    
    func getView() -> NewsListingControllerProtocol?
    func navigateToArticle(news: NewsEntity)
}

protocol NewsListingPresenterProtocol {
    var view: NewsListingControllerProtocol? {get set}
    var interactor: NewsListingInteractorProtocol? {get set}
    var router: NewsListingRouterProtocol? {get set}
    var news: Array<NewsEntity> {get}
    
    func requestContent()
    func requestImages()
    func finishedDowloading(_ content: [NewsEntity])
    func failedToDownloadNews()
    func navigateToArticle(index: Int)
}

protocol NewsListingInteractorProtocol {
    var presenter: NewsListingPresenterProtocol? {get set}
    var service: NetworkProtocol? {get set}
    
    func makeNewsRequest()
    func makeImageRequests(url: URL) async throws -> UIImage?
    
    
}


