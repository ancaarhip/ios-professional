//
//  MovieTileView.swift
//  Movie
//
//  Created by Anca Arhip on 31.10.2022.
//

import SwiftUI

struct MovieTileView: View {
    
    // MARK: - PROPERTIES
    
    @EnvironmentObject var favorites: Favorites<Movie>
    
    @State var movieModel: MovieContainer 
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            AsyncImageView(poster: movieModel.movie.poster)
            
            HStack {
                Text(String(format: "%.d", movieModel.movie.releaseYear))
                    .foregroundColor(Color("TextColor"))
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image("ic_star")
                    
                Text(String(format: "%.1f", movieModel.movie.averageRating))
                    .foregroundColor(Color("TextColor"))
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    movieModel.favToggle(favorites)
                } label: {
                    Image(movieModel.favIcon)
                }
                
            } //: HSTACK
            .padding(EdgeInsets(top: 2, leading: 12, bottom: 12, trailing: 12))
        } //: VSTACK
        .background(Color.accentColor)
        .cornerRadius(5)
        
    }
}

//struct MovieTileView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieTileView()
//    }
//}
