//Created by Lugalu on 12/05/24.

import UIKit

class NewsListViewController: UIViewController, NewsListView.Delegate {
    
    

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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsListCell.reuseIdentifier, for: indexPath) as? NewsListCell else {
            return UITableViewCell()
        }
        cell.setup()
        cell.insertImage(image: UIImage(named: "Bird"))
        
        return cell
    }
}

