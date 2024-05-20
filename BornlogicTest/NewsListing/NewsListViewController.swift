//Created by Lugalu on 12/05/24.

import UIKit

class NewsListViewController: UIViewController, NewsListingControllerProtocol, NewsListView.Delegate { 
    var presenter: (any NewsListingPresenterProtocol)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.requestContent()
        setup()
    }

    
    private func setup(){
        let newsView = NewsListView(delegate: self)
        view = newsView
        makeNavigation()
    }
    
    private func makeNavigation(){
        self.navigationItem.title = "Hoje no Brasil"
        self.navigationItem.largeTitleDisplayMode = .always
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  presenter?.news.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: NewsListCell.reuseIdentifier, for: indexPath) as? NewsListCell,
              let news = presenter?.news[indexPath.row]
        else {
            return UITableViewCell()
        }        
        
        cell.setup(content: news)
        
        tableView.invalidateIntrinsicContentSize()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        presenter?.navigateToArticle(index: index)
    }
    
    
    func updateViewContent() {
        let newsView = view as? NewsListView
        newsView?.tableView.reloadData()
    }
    
    func showErrorAlert() {
        fatalError("not implemented")
    }
    
    func reloadCells() {
        let newsView = view as? NewsListView
        newsView?.tableView.reloadData()

    }
}

