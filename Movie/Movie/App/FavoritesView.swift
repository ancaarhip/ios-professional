//
//  FavoritesView.swift
//  Movie
//
//  Created by Anca Arhip on 01.11.2022.
//

import SwiftUI
import Combine

struct FavoritesView: View {
    
    // MARK: - PROPERTIES
    
    @ObservedObject var viewModel = FavoritesViewModel()
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            VStack {
                MoviesGridView(movies: viewModel.favoriteMovies)
            } //: VSTACK
            .navigationBarTitle(Tab.favorites.rawValue, displayMode: .inline)
            .navigationBarItems(
                trailing:
                    SortButtonView(sender: Tab.favorites)
            )
        } //: NAVIGATION
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
