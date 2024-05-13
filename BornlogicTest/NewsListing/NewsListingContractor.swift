//Created by Lugalu on 13/05/24.

import UIKit

protocol NewsListingControllerProtocol: UIViewController {
    var presenter: NewsListingPresenterProtocol? {get set}
    
    func updateViewContent()
}

protocol NewsListingRouterProtocol {
    var view: NewsListingControllerProtocol? {get}
    static func getRouter() -> NewsListingRouterProtocol
    
    func getView() -> NewsListingControllerProtocol
    func navigateToArticle()// add content and view
}

protocol NewsListingPresenterProtocol {
    var view: NewsListingControllerProtocol? {get}
    var interactor: NewsListingInteractorProtocol? {get }
    var router: NewsListingRouterProtocol? {get}
    
    func requestContent()
    func finishedDowloading()
}

protocol NewsListingInteractorProtocol {
    var presenter: NewsListingPresenterProtocol? {get}
    
    func makeNewsRequest()
    func makeImageRequests()
    
    
}


