//
//  AccountSummaryViewcontroller+Networking.swift
//  Bankey
//
//  Created by Anca Arhip on 17.10.2022.
//

import UIKit



struct Account: Codable {
    let id: String
    let type: AccountType
    let name: String
    let amount: Decimal
    let createdDateTime: Date
    
    static func makeSkeleton() -> Account {
        return Account(id: "1", type: .Banking, name: "Account name", amount: 0.0, createdDateTime: Date())
    }
}



extension AccountSummaryViewController {
    func fetchAccounts(withId: String, completion: @escaping((Result<[Account], NetworkError>) -> Void)) {
        let url = URL(string: "https://fierce-retreat-36855.herokuapp.com/bankey/profile/\(withId)/accounts")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(NetworkError.serverError))
                    return
                }
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                do {
                    let accounts = try decoder.decode([Account].self, from: data)
                    completion(.success(accounts))
                } catch {
                    completion(.failure(NetworkError.decodingError))
                    return
                }
            }
        }.resume()
    }
}
