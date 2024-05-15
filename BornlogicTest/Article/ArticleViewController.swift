//Created by Lugalu on 14/05/24.

import UIKit


class ArticleViewController: UIViewController, ArticleControllerProtocol {
    var presenter: ArticlePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let newView = ArticleView()
        guard let content = presenter?.content else {
            self.dismiss(animated: true)
            return
        }
        
        Task(priority: .userInitiated) {
            if content.image == nil && content.urlToImage != nil{
                let image = try? await presenter?.interactor?.downloadImage(url: content.urlToImage!)
                content.image = image
            }
            newView.setup(content: content)
        }
        view = newView
        
        self.navigationItem.largeTitleDisplayMode = .never
    }
}

