//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Anca Arhip on 15.10.2022.
//

import UIKit

class AccountSummaryViewController: UIViewController {
    
    // Request Models
    var profile: Profile?
    var accounts: [Account] = []
    
    // View Models
    var headerViewModel = AccountSummaryHeaderView.ViewModel(welcomeMessage: "Welcome", name: "", date: Date())
    var accountCellViewModels: [AccountSummaryCell.ViewModel] = []
    
    // Components
    var tableVIew = UITableView()
    var headerView = AccountSummaryHeaderView(frame: .zero)
    let refreshControl = UIRefreshControl()
    
    var isLoaded = false
    
    lazy var logoutBarButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        barButtonItem.tintColor = .label
        return barButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension AccountSummaryViewController {
    private func setup() {
        setupNavigationBar()
        setupTableView()
        setupTableHeaderView()
        setupRefreshControl()
        setupSkeletons()
        fetchData()
    }
    
    func setupTableView() {
        tableVIew.backgroundColor = appColor
        tableVIew.delegate = self
        tableVIew.dataSource = self
        
        tableVIew.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseId)
        tableVIew.register(SkeletonCell.self, forCellReuseIdentifier: SkeletonCell.reuseId)
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
        var size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        headerView.frame.size = size
        
        tableVIew.tableHeaderView = headerView
    }
    
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = logoutBarButton
    }
    
    private func setupRefreshControl() {
        refreshControl.tintColor = appColor
        refreshControl.addTarget(self, action: #selector(refreshContent), for: .valueChanged)
        tableVIew.refreshControl = refreshControl
    }
    
    private func setupSkeletons() {
        let row = Account.makeSkeleton()
        let skeletonArray = Array(repeating: row, count: 10)
        configureTableCells(withAccounts: skeletonArray)
    }
}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !accountCellViewModels.isEmpty else { return UITableViewCell() }
        let acccount = accountCellViewModels[indexPath.row]
        
        if isLoaded {
            let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseId, for: indexPath) as! AccountSummaryCell
            cell.configure(with: acccount)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: SkeletonCell.reuseId, for: indexPath) as! SkeletonCell
        return cell
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - Actions
extension AccountSummaryViewController {
    @objc func logoutTapped() {
        NotificationCenter.default.post(name: .logout, object: nil)
    }
    
    @objc func refreshContent() {
        reset()
        setupSkeletons()
        tableVIew.reloadData()
        fetchData()
    }
    
    private func reset() {
        profile = nil
        accounts = []
        isLoaded = false
    }
}

// MARK: - Networking
extension AccountSummaryViewController{
    private func fetchData() {
        let group = DispatchGroup()
        
        let userId = Int.random(in: 1...3)
        
        group.enter()
        fetchProfile(forUserId: "\(userId)") { result in
            switch result {
            case .success(let profile):
                self.profile = profile
            case .failure(let error):
                print(error.localizedDescription)
            }
            group.leave()
        }
        
        group.enter()
        fetchAccounts(withId: "\(userId)") { result in
            switch result {
            case .success(let accounts):
                self.accounts = accounts
            case .failure(let error):
                print(error)
            }
            group.leave()
        }
        
        group.notify(queue: .main) {
            self.tableVIew.refreshControl?.endRefreshing()
            
            guard let profile = self.profile else { return }
            
            self.isLoaded = true
            self.configureTableHeader(with: profile)
            self.configureTableCells(withAccounts: self.accounts)
            self.tableVIew.reloadData()
        }
    }
    
    private func configureTableHeader(with profile: Profile) {
        let vm = AccountSummaryHeaderView.ViewModel(welcomeMessage: "Good morning",
                                                    name: profile.firstName,
                                                    date: Date())
        headerView.configure(viewModel: vm)
    }
    
    private func configureTableCells(withAccounts: [Account]) {
        accountCellViewModels = withAccounts.map {
            AccountSummaryCell.ViewModel(accountType: $0.type, accountName: $0.name, balance: $0.amount)
        }
    }
}
