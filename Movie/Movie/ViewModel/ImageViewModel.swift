//
//  ImageViewModel.swift
//  Movie
//
//  Created by Anca Arhip on 01.11.2022.
//

import SwiftUI
import Combine

class ImageViewModel: ObservableObject {
    
    @Published var image: UIImage?
    
    private let imageLoader = ImageLoader()
    
    private var imageSubscriber: AnyCancellable?
    
    init(poster: String = "") {
        imageLoader.load(poster)
        
        imageSubscriber = imageLoader.image
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: {
                self.image = UIImage(data: $0)
            })
    }
}
