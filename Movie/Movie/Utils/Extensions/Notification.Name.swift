//
//  Notification.Name.swift
//  Movie
//
//  Created by Anca Arhip on 02.11.2022.
//

import Foundation

extension Notification.Name {
    
    static let favorites = Notification.Name("FavoriteMovie")
    
    static func sort(_ sender: String) -> Notification.Name {
        return Notification.Name("Sort" + sender)
    }
}
