//
//  TableViewController.swift
//  Beers
//
//  Created by Anca Arhip on 15.11.2022.
//

import UIKit

class TableViewController: UIViewController {
    
    var beersTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    private func setupUI() {
        beersTableView.delegate = self
        beersTableView.dataSource = self
        
        beersTableView.register(BeerCellView.self, forCellReuseIdentifier: BeerCellView.beerCellId)
        beersTableView.rowHeight = BeerCellView.rowHeight
        
        view.addSubview(beersTableView)
        
        beersTableView.translatesAutoresizingMaskIntoConstraints = false

        // Layout
        NSLayoutConstraint.activate([
            beersTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            beersTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            beersTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            beersTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension TableViewController: UITableViewDelegate {
    
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BeerCellView.beerCellId, for: indexPath) as! BeerCellView
        return cell 
    }
    
    
}

