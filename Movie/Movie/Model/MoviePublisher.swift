//
//  MoviePubliser.swift
//  Movie
//
//  Created by Anca Arhip on 01.11.2022.
//

import Foundation
import Combine

struct MoviePublisher {
    
    var moviesService: DataService = Http()
    
    private var moviesSubject = PassthroughSubject<[MovieModel], Error>()
    
    var movies: AnyPublisher<[MovieModel], Error> {
        return moviesSubject.eraseToAnyPublisher()
    }
    
    func fetch(for recommendation: RecommendationType? = nil, with queryString: String? = nil) {
        
        guard var urlComponents = URLComponents(url: Constants.baseURL, resolvingAgainstBaseURL: false) else {
            moviesSubject.send(completion: .failure(NetworkError.invalidURL))
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: Constants.apiKey),
        ]
        
        if let recommandation = recommendation {
            urlComponents.path.append("\(Constants.movies)")
            urlComponents.path.append("/\(recommandation)")
        }
        
        if let queryString = queryString {
            urlComponents.path.append("\(Constants.search)")
            urlComponents.path.append("\(Constants.movies)")
            urlComponents.queryItems?.append(URLQueryItem(name: "query", value: queryString))
        }
        
        guard let url = urlComponents.url else {
            moviesSubject.send(completion: .failure(NetworkError.invalidQuery))
            return
        }
        
        get(url)
    }
    
    private func get(_ url: URL) {
        moviesService.get(url) { result in
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
