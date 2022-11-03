//
//  MovieTileView.swift
//  Movie
//
//  Created by Anca Arhip on 01.11.2022.
//

import SwiftUI

struct MovieTileView: View {
    
    // MARK: - PROPERTIES
    
    var movieModel: MovieContainer
    
    @State var favIcon: String = "Placeholder"
    
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
                    favIcon = movieModel.favToggle()
                } label: {
                    Image(favIcon)
                        .padding(.all, 3)
                }
                
            } //: HSTACK
            .onAppear {
                favIcon = movieModel.favIcon
            }
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
