//
//  AsyncImageView.swift
//  Movie
//
//  Created by Anca Arhip on 31.10.2022.
//

import SwiftUI
import Combine

struct AsyncImageView: View {
    
    var poster: String?
    
    @ObservedObject private var imageModel: ImageViewModel
    
    init(poster: String = "") {
        imageModel = ImageViewModel(poster: poster)
    }
    
    var body: some View {
        if let image = imageModel.image {
            Image(uiImage: image).resizable().scaledToFit()
                .cornerRadius(4)
                .padding(.all, 3)
        } else {
            Image(systemName: "photo")
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView()
    }
}
