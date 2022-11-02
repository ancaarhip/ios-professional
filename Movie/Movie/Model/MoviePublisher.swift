//
//  MoviePubliser.swift
//  Movie
//
//  Created by Anca Arhip on 31.10.2022.
//

import Foundation
import Combine

struct MoviePublisher {
    
    var networkService: NetworkService = Http()
    
    private var moviesSubject = PassthroughSubject<[MovieModel], Error>()
    
    var movies: AnyPublisher<[MovieModel], Error> {
        return moviesSubject.eraseToAnyPublisher()
    }
    
    func fetch(_ recommandation: RecommendationType) {
        guard var urlComponents = URLComponents(url: Constants.baseURL, resolvingAgainstBaseURL: false) else {
            moviesSubject.send(completion: .failure(NetworkError.invalidURL))
            return
        }
        urlComponents.path.append("\(Constants.endpoint)/\(recommandation)")
        
        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: Constants.apiKey),
        ]
        
        guard let url = urlComponents.url else {
            moviesSubject.send(completion: .failure(NetworkError.invalidQuery))
            return
        }
        
        get(url)
    }
    
    private func get(_ url: URL) {
        networkService.get(url) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(Date.movieDateFormatter)
                    let movieData = try decoder.decode(MovieData.self, from: data)
                    moviesSubject.send(movieData.results)
                } catch {
                    moviesSubject.send(completion: .failure(NetworkError.decodingError))
                }
            case .failure(let error):
                moviesSubject.send(completion: .failure(error))
            }
        }
    }
    
}
