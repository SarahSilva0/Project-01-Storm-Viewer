//
//  TableViewStorm.swift
//  StormViewer
//
//  Created by Sarah dos Santos Silva on 27/02/23.
//

import UIKit

class TableViewStorm: UIView {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false // cursor que aparece quando está scrollando a table
        tableView.separatorStyle = .none // separator entre as celulas
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundConfig()
        configSubViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSubViews(){
        addSubview(self.tableView)
    }
    private func backgroundConfig(){
        self.backgroundColor = .white
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}
