//
//  ImageLoader.swift
//  Movie
//
//  Created by Anca Arhip on 01.11.2022.
//

import Foundation
import Combine

struct ImageLoader {
    
    var networkService: DataService = Http()
    
    private var imageSubject = PassthroughSubject<Data, Error>()
    
    var image: AnyPublisher<Data, Error> {
        return imageSubject.eraseToAnyPublisher()
    }
    
    func load(_ poster: String) {
        guard var urlComponents = URLComponents(url: Constants.baseImageURL, resolvingAgainstBaseURL: false) else {
            imageSubject.send(completion: .failure(NetworkError.invalidURL))
            return
        }
        
        urlComponents.path.append("\(poster)")
        
        guard let url = urlComponents.url else {
            imageSubject.send(completion: .failure(NetworkError.invalidURL))
            return
        }
        
        get(url)
    }
    
    private func get(_ url: URL) {
        networkService.get(url) { result in
            switch result {
            case .success(let data):
                imageSubject.send(data)
            case .failure(let error):
                imageSubject.send(completion: .failure(error))
            }
        }
    }
}
