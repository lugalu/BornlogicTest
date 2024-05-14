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
        newView.setup(content: content)
        view = newView
        guard let date = content.publishedAt else {
            return
        }
        self.navigationItem.title = date.formatted(.dateTime)
        self.navigationItem.backButtonTitle = "Notícias"
        self.navigationItem.largeTitleDisplayMode = .never
    }
}
