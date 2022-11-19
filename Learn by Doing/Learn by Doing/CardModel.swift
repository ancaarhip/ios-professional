//
//  CardModel.swift
//  Learn by Doing
//
//  Created by Anca Arhip on 18.11.2022.
//

import SwiftUI

// MARK: - CARD MODEL

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
