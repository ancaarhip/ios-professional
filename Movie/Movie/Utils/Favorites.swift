//
//  Favorites.swift
//  Movie
//
//  Created by Anca Arhip on 01.11.2022.

// From https://www.hackingwithswift.com/books/ios-swiftui/letting-the-user-mark-favorites

import SwiftUI
import Combine

class Favorites<T: Codable>: ObservableObject where T: Hashable {
    
    private var favorites: Set<T> // Sohuld store only the ids - ideally

    private let saveKey = "Favorites"

    init() {
        favorites = []
        
        if let favoritesData = UserDefaults.standard.object(forKey: saveKey) as? Data {
            do {
                favorites = try JSONDecoder().decode(Set<T>.self, from: favoritesData)
            } catch {
                print("Eror decoding favorites data \(error)")
            }
        }
        
    }

    func contains(_ favorite: T) -> Bool {
        favorites.contains(favorite)
    }

    func add(_ favorite: T) {
        objectWillChange.send()
        favorites.insert(favorite)
        save()
    }

    func remove(_ favorite: T) {
        objectWillChange.send()
        favorites.remove(favorite)
        save()
    }

    func save() {
        do {
            let favoritesData = try JSONEncoder().encode(favorites)
            UserDefaults.standard.set(favoritesData, forKey: saveKey)
        } catch {
            print("Error encoding favorites data \(error)")
        }
    }
    
    func getFavorites() -> Set<T> {
        return favorites
    }
}
