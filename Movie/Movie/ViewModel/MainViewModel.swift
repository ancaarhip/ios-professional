//
//  MainViewModel.swift
//  Movie
//
//  Created by Anca Arhip on 01.11.2022.
//

import SwiftUI

enum Tab: String {
    case favorites = "Favorites"
    case home = "Home"
    case search = "Search"
}

extension MainView {
    
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
