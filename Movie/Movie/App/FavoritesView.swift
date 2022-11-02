//
//  FavoritesView.swift
//  Movie
//
//  Created by Anca Arhip on 30.10.2022.
//

import SwiftUI

struct FavoritesView: View {
    
    // MARK: - PROPERTIES
    
    @EnvironmentObject var favorites: Favorites<Movie>
    
    // MARK: - BODY
    
    var body: some View {
        MoviesGridView(movies: FavoritesViewModel(favorites).favoriteMovies)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
