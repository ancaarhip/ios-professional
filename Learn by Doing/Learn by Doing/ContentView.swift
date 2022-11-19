//
//  ContentView.swift
//  Learn by Doing
//
//  Created by Anca Arhip on 17.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PREOPERTIES
    
    var cards: [Card] = cardData
    
    // CONTENT

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(cards) { card in
                    CardView(card: card)
                }
            } //: HSTACK
            .padding(20)
        }
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
