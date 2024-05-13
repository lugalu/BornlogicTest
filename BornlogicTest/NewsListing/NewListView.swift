//Created by Lugalu on 12/05/24.

import UIKit

class NewsListView: UIView, ViewCode {
    
    protocol Delegate: UITableViewDataSource & UITableViewDelegate {
    }
    
    private var delegate: Delegate?
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(NewsListCell.self, forCellReuseIdentifier: NewsListCell.reuseIdentifier)
        table.delegate = delegate
        table.dataSource = delegate
        
        table.separatorColor = .accent
        table.separatorInset = UIEdgeInsets(top: 0, left: -100, bottom: 0, right: -100)
        table.backgroundColor = .clear
 
        table.rowHeight = UITableView.automaticDimension
        
        return table
    }()
    
    init(delegate: Delegate?) {
        super.init(frame: .zero)
        self.delegate = delegate
        backgroundColor = .appBackground
        setup()
    }
    
    required init?(coder: NSCoder) {
        delegate = nil
        super.init(coder: coder)
    }
    
    func setup(){
        makeTable()
    }
    
    private func makeTable(){
        self.addSubview(tableView)
        
        let constraints = [
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
}
