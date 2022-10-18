//
//  AccountSummaryViewcontroller+Networking.swift
//  Bankey
//
//  Created by Anca Arhip on 17.10.2022.
//

import UIKit

enum NetworkError: Error {
    case serverError
    case decodingError
}

struct Profile: Codable {
    let id: String
    let firstName: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
    }
}

struct Account: Codable {
    let id: String
    let type: AccountType
    let name: String
    let amount: Decimal
    let createdDateTime: Date
}

extension AccountSummaryViewController {
    func fetchProfile(forUserId: String, completion: @escaping((Result<Profile, NetworkError>) -> Void)) {
        let url = URL(string: "https://fierce-retreat-36855.herokuapp.com/bankey/profile/\(forUserId)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                do {
                    let profile = try JSONDecoder().decode(Profile.self, from: data)
                    completion(.success(profile))
                } catch {
                    completion(.failure(.decodingError))
                    return
                }
            }
            
        }.resume()
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
