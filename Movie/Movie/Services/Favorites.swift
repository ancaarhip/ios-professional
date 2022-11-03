//
//  Favorites.swift
//  Movie
//
//  Created by Anca Arhip on 01.11.2022.

// From https://www.hackingwithswift.com/books/ios-swiftui/letting-the-user-mark-favorites

import SwiftUI
import Combine

class Favorites: ObservableObject {
    
    private var favorites: Set<Movie> // Sohuld store only the ids - ideally

    private let saveKey = "Favorites"
    
    static var instance = Favorites()

    private init() {
        favorites = []
        
        if let favoritesData = UserDefaults.standard.object(forKey: saveKey) as? Data {
            do {
                favorites = try JSONDecoder().decode(Set<Movie>.self, from: favoritesData)
            } catch {
                print("Eror decoding favorites data \(error)")
            }
        }
    }

    func contains(_ favorite: Movie) -> Bool {
        favorites.contains(favorite)
    }

    func add(_ favorite: Movie) {
        favorites.insert(favorite)
        broadcast()
        save()
    }

    func remove(_ favorite: Movie) {
        favorites.remove(favorite)
        broadcast()
        save()
    }

    private func save() {
        do {
            let favoritesData = try JSONEncoder().encode(favorites)
            UserDefaults.standard.set(favoritesData, forKey: saveKey)
        } catch {
            print("Error encoding favorites data \(error)")
        }
    }
    
    private func broadcast() {
        objectWillChange.send()
    }
    
    func getFavorites() -> Set<Movie> {
        return favorites
    }
}
