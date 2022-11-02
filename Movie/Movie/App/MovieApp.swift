//
//  MovieApp.swift
//  Movie
//
//  Created by Anca Arhip on 30.10.2022.
//

import SwiftUI

@main
struct MovieApp: App {
    
    @StateObject var favorites = Favorites<Movie>()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(favorites)
        }
    }
}
