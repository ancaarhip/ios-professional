//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Anca Arhip on 12.11.2022.
//

import Foundation
struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
