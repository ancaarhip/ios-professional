//
//  Http.swift
//  Movie
//
//  Created by Anca Arhip on 01.11.2022.
//

import Foundation

enum NetworkError: Error {
    case serverError
    case invalidURL
    case invalidQuery
    case decodingError
}

protocol DataService {
    func get(_ url: URL, _ completion: @escaping((_ result: Result<Data, Error>) -> Void))
}

struct Http: DataService {
    
    func get(_ url: URL, _ completion: @escaping ((Result<Data, Error>) -> Void)) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                return completion(.success(data))
            } else if let error = error {
                return completion(.failure(error))
            } else {
                return completion(.failure(NetworkError.serverError))
            }
        }
        .resume()
    }
}
