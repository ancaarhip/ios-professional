//
//  ViewController.swift
//  AlertTableUIKit
//
//  Created by Anca Arhip on 07.11.2022.
//

import UIKit

class ViewController: UIViewController {

    var tableView = UITableView()
    
     var tableModel = TableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setup()
        
        dataBinding()
    }
    
    func dataBinding() {
        tableModel.alerts.bind { [weak self] _ in
            self?.tableView.reloadData()
        }
    }

    func setup() {
        // Layout
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(AlertCellView.self, forCellReuseIdentifier: AlertCellView.reuseId)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

        ])
        
        // Style
    }

}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlertCellView.reuseId, for: indexPath) as! AlertCellView
        cell.setUp(tableModel.alerts.value[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
}

