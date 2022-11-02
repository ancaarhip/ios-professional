//
//  MovieViewModel.swift
//  Movie
//
//  Created by Anca Arhip on 31.10.2022.
//

import Foundation
import Combine


class MoviesViewModel: ObservableObject {
    
    @Published var movies: [MovieContainer] = []
    
    @Published var recommendation: RecommendationType = .now_playing {
        didSet {
            moviePublisher.fetch(recommendation)
        }
    }
    
    @Published var sortedBy: SortType = SortType.none {
        didSet {
            switch sortedBy {
            case .ratingAsc:
                movies = movies.sortedObjects(by: \.movie.averageRating, <)
            case .ratingDesc:
                movies = movies.sortedObjects(by: \.movie.averageRating, >)
            case .releaseAsc:
                movies = movies.sortedObjects(by: \.movie.releaseYear, <)
            case .releaseDesc:
                movies = movies.sortedObjects(by: \.movie.releaseYear, >)
            default:
                return
            }
        }
    }
    
    private let moviePublisher = MoviePublisher()
    
    private var movieSubscriber: AnyCancellable?
    
    init() {
        recommendation = .now_playing
        
        let favorites = Favorites<Movie>()
        
        movieSubscriber = moviePublisher.movies
            .receive(on: DispatchQueue.main)
            .sink { error in
                print(error)
            } receiveValue: { movies in
                self.movies = movies.map {
                    let movie = Movie($0)
                    return MovieContainer(movie: movie, favorites: favorites)
                }
            }
    }
}
