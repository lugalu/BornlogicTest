//Created by Lugalu on 12/05/24.

import UIKit

class NewsListViewController: UIViewController, NewsListingControllerProtocol, NewsListView.Delegate { 
    var presenter: (any NewsListingPresenterProtocol)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.requestContent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        navigationController?.navigationBar.prefersLargeTitles = true
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
        
        
        if let visible = tableView.indexPathsForVisibleRows {
            visible.forEach{ index in
                presenter?.requestImage(for: index)
            }
        }
        
        
        cell.setup(news: news)
        
        tableView.invalidateIntrinsicContentSize()
        
        return cell
    }
    
    
    func updateViewContent() {
        let newsView = view as? NewsListView
        newsView?.tableView.reloadData()
    }
    
    func showErrorAlert() {
        fatalError("not implemented")
    }
    
    func reloadCell(index: IndexPath) {
        let newsView = view as? NewsListView
        newsView?.tableView.reloadData()

    }
}

