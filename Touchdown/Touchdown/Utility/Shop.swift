//
//  Shop.swift
//  Touchdown
//
//  Created by Anca Arhip on 12.11.2022.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
