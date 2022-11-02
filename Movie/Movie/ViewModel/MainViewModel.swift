//
//  MainViewModel.swift
//  Movie
//
//  Created by Anca Arhip on 30.10.2022.
//

import SwiftUI

extension MainView {
    enum Tab: String {
        case favorites = "Favorites"
        case home = "Home"
        case search = "Search"
    }
    
    var tabs: [Tab: (text: Text, image: Image)] {
        [
            .favorites: (
                Text("Favorites"),
                Image("ic_favorites")
            ),
            .home: (
                Text("Home"),
                Image("ic_home")
            ),
            .search: (
                Text("Search"),
                Image("ic_search")
            ),
        ]
    }
}
