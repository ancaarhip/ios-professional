//
//  MoviesGridView.swift
//  Movie
//
//  Created by Anca Arhip on 01.11.2022.
//

import SwiftUI

struct MoviesGridView: View {
    
    // MARK: - PROPERTIES
    
    private let gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var movies: [MovieContainer]

    // MARK: - BODY
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 6) {
                
                ForEach(movies, id: \.movie.id) { item in
                    MovieTileView(movieModel: item)
                    
                }
            } //: GRID
            .padding(.horizontal, 6)
            .padding(.vertical, 6)
            
        } //: SCROLL
        .background(Color("BackgroundColor"))
    }
}

struct MoviesGridView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesGridView(movies: [])
    }
}
