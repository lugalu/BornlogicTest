//Created by Lugalu on 12/05/24.

import UIKit

class NewsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

