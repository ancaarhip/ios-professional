//
//  MovieViewModel.swift
//  Movie
//
//  Created by Anca Arhip on 01.11.2022.
//

import Foundation
import Combine


class MoviesViewModel: ObservableObject {
    
    @Published var movies: [MovieContainer] = []
    
    @Published var recommendation: RecommendationType = .now_playing {
        didSet {
            moviePublisher.fetch(for: recommendation)
        }
    }
    
    @Published var queryString: String = "" {
        didSet {
            if !queryString.isEmpty {
                moviePublisher.fetch(with: queryString)
            }
        }
    }
    
    @Published var sortedBy: SortType = SortType.none {
        didSet {
            movies = movies.sortMovies(by: sortedBy)
        }
    }
    
    private let moviePublisher = MoviePublisher()
    
    private var movieSubscriber: AnyCancellable?
    
    init() {
        
        movieSubscriber = moviePublisher.movies
            .receive(on: DispatchQueue.main)
            .sink { error in
                print(error)
            } receiveValue: { movies in
                self.movies = movies.map {
                    MovieContainer(movie: Movie($0))
                }
            }
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(sortMovies),
            name: Notification.Name.sort(Tab.home.rawValue),
            object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func sortMovies(_ notification: NSNotification) {
        sortedBy = notification.object as? SortType ?? .none
    }
}
