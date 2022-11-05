//
//  FavoritesViewModel.swift
//  Movie
//
//  Created by Anca Arhip on 02.11.2022.
//

import Foundation
import Combine

class FavoritesViewModel: ObservableObject {
    
    @Published var favoriteMovies: [MovieContainer] = []
    
    private var sortType: SortType = .none
    
    private var movieSubscriber: AnyCancellable?
    
    init() {
        
        movieSubscriber = Favorites.instance.objectWillChange
            .sink(receiveValue: { [weak self] _ in
                self?.loadFavorites()
            })
            
        loadFavorites()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(sortFavorites(_: )),
            name: Notification.Name.sort(Tab.favorites.rawValue),
            object: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func loadFavorites() {
        favoriteMovies = Favorites.instance.getFavorites().map {
            MovieContainer(movie: $0)
        }
        .sortMovies(by: sortType)
    }
    
    @objc func sortFavorites(_ notification: Notification) {
        sortType = notification.object as? SortType ?? .none
        favoriteMovies = favoriteMovies.sortMovies(by: sortType)
    }
}
