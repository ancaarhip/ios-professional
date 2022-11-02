//
//  FavoritesViewModel.swift
//  Movie
//
//  Created by Anca Arhip on 02.11.2022.
//

import Foundation

struct FavoritesViewModel {
    
    var favoriteMovies: [MovieContainer]
    
    init(_ favorites: Favorites<Movie>) {
        favoriteMovies = favorites.getFavorites().map {
            MovieContainer(movie: $0, favorites: favorites)
        }
    }
}
