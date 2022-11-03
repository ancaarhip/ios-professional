//
//  SearchView.swift
//  Movie
//
//  Created by Anca Arhip on 01.11.2022.
//

import SwiftUI

struct SearchView: View {
    
    // MARK: - PROPERTIES
    
    @StateObject var moviesViewModel = MoviesViewModel()

    // MARK: - BODY
    
    var body: some View {
        NavigationView {
        
            VStack {
                SearchBarView(searchText: $moviesViewModel.queryString)
                    .padding(.bottom, 40)
                
                MoviesGridView(movies: moviesViewModel.movies)
            }//: VSTACK
        } //: NAVIGATION
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
