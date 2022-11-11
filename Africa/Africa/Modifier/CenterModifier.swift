//
//  CenterModifier.swift
//  Africa
//
//  Created by Anca Arhip on 11.11.2022.
//

import SwiftUI

struct Centermodifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
