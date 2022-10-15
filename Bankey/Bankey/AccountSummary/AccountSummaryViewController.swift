//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Anca Arhip on 15.10.2022.
//

import UIKit

class AccountSummaryViewController: UIViewController {
    
    var accounts:[AccountSummaryCell.ViewModel] = []
    
    var tableVIew = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension AccountSummaryViewController {
    private func setup() {
        setupTableView()
        setupTableHeaderView()
        fetchData()
    }
    
    func setupTableView() {
        tableVIew.backgroundColor = appColor
        tableVIew.delegate = self
        tableVIew.dataSource = self
        
        tableVIew.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseId)
        tableVIew.rowHeight = AccountSummaryCell.rowHeigh
        
        tableVIew.tableFooterView = UIView()
        
        tableVIew.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableVIew)
        
        NSLayoutConstraint.activate([
            tableVIew.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableVIew.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableVIew.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableVIew.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupTableHeaderView() {
        let header = AccountSummaryHeaderView(frame: .zero)
        
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        
        tableVIew.tableHeaderView = header
    }
}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !accounts.isEmpty else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseId, for: indexPath) as! AccountSummaryCell
        let acccount = accounts[indexPath.row]
        cell.configure(with: acccount)
        
        return cell
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension AccountSummaryViewController {
    func fetchData() {
        let savings = AccountSummaryCell.ViewModel(accountType: .Banking,
                                                            accountName: "Basic Savings",
                                                        balance: 929466.23)
        let chequing = AccountSummaryCell.ViewModel(accountType: .Banking,
                                                    accountName: "No-Fee All-In Chequing",
                                                    balance: 17562.44)
        let visa = AccountSummaryCell.ViewModel(accountType: .CreditCard,
                                                       accountName: "Visa Avion Card",
                                                       balance: 412.83)
        let masterCard = AccountSummaryCell.ViewModel(accountType: .CreditCard,
                                                       accountName: "Student Mastercard",
                                                       balance: 50.83)
        let investment1 = AccountSummaryCell.ViewModel(accountType: .Investment,
                                                       accountName: "Tax-Free Saver",
                                                       balance: 2000.00)
        let investment2 = AccountSummaryCell.ViewModel(accountType: .Investment,
                                                       accountName: "Growth Fund",
                                                       balance: 15000.00)

        accounts.append(savings)
        accounts.append(chequing)
        accounts.append(visa)
        accounts.append(masterCard)
        accounts.append(investment1)
        accounts.append(investment2)
    }
}
