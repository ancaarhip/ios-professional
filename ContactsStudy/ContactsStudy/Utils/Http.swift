//
//  Http.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 03.11.2022.
//

import Foundation
import Combine

enum NetworkError: Error {
    case serverError
    case invalidURL
    case decodingError
    case invalidQuery
}

struct Http {
    
    func get<T: Codable>(_ url: URL) -> AnyPublisher<T, Error> {
        
        let cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
        return cancellable
    }
    
    func getData(_ url: URL) -> AnyPublisher<Data, Error> {
        
        let cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .mapError{ error -> Error in
                NetworkError.serverError
            }
            .eraseToAnyPublisher()
        
        return cancellable
    }
}
