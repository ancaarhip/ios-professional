//
//  ViewController.swift
//  DiffableDataTable
//
//  Created by Anca Arhip on 25.10.2022.
//

import UIKit

class DiffableDataViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    let diffableTableView = UITableView()
    let searchBar = UISearchBar()
    
    var dataSource: UITableViewDiffableDataSource<Section, MountainsController.Mountain>!
    
    let reuseCellId = "mountain-cell-id"
    
    let mountainController = MountainsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        loadData()
    }
}

extension DiffableDataViewController {
    func style() {
        diffableTableView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func layout() {
        for addedView in [searchBar, diffableTableView] {
            view.addSubview(addedView)
            addedView.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            diffableTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            diffableTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            diffableTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            diffableTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

    }
    
    func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, MountainsController.Mountain> (tableView: diffableTableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseCellId, for: indexPath)
            cell.textLabel?.text = itemIdentifier.name
            return cell
        })
    }
    
    func loadData(_ searchedString: String = "") {
        let mountains = MountainsController().getMountains(filter: searchedString).sorted { $0.name < $1.name }
        var snapshot = NSDiffableDataSourceSnapshot<Section, MountainsController.Mountain>()
        snapshot.appendSections([.main])
        snapshot.appendItems(mountains, toSection: .main)
        dataSource.apply(snapshot)
    }
    
    func setup() {
        diffableTableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseCellId)
        searchBar.delegate = self
        
        layout()
        
        style()
        
        configureDataSource()
    }
}

extension DiffableDataViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        loadData(searchText)
    }
}
