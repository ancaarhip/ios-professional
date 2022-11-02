//
//  MovieViewModel.swift
//  Movie
//
//  Created by Anca Arhip on 01.11.2022.
//

import Foundation


struct Movie: Hashable, Codable {
    var id: Int
    var poster: String
    var releaseYear: Int
    var averageRating: Double
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id
    }
    
    init(_ movieModel: MovieModel) {
        self.id = movieModel.id
        self.poster = movieModel.poster
        self.releaseYear = movieModel.releaseDate.year
        self.averageRating = movieModel.averageRating
    }
}

struct MovieContainer {
    var movie: Movie
    var favIcon: String
    
    init(movie: Movie, favorites: Favorites<Movie>) {
        self.movie = movie
        self.favIcon = favorites.contains(movie)
                ? "ic_add_to_favorites_red"
                : "ic_add_to_favorites_black"
    }
    
    mutating func favToggle(_ favorites: Favorites<Movie>) {        
        if favorites.contains(movie) {
            favorites.remove(movie)
            self.favIcon = "ic_add_to_favorites_black"
        } else {
            favorites.add(movie)
            self.favIcon = "ic_add_to_favorites_red"
        }
    }
}
