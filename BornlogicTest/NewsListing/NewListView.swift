//Created by Lugalu on 12/05/24.

import UIKit

class NewsListView: UIView{
    
    protocol Delegate: UITableViewDataSource & UITableViewDelegate {
        
    }
    
    private var delegate: Delegate?
    
    init(delegate: Delegate?){
        super.init(frame: .zero)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        delegate = nil
        super.init(coder: coder)
    }
    
}
