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
    var favIcon: String {
        Favorites.instance.contains(movie)
                ? "ic_add_to_favorites_red"
                : "ic_add_to_favorites_black"
    }
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func favToggle() -> String {
        if Favorites.instance.contains(movie) {
            Favorites.instance.remove(movie)
        } else {
            Favorites.instance.add(movie)
        }
        return favIcon
    }
    
}
