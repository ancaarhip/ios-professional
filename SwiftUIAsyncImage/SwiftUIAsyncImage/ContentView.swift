//
//  ContentView.swift
//  SwiftUIAsyncImage
//
//  Created by Anca Arhip on 21.10.2022.
//

import SwiftUI

struct ContentView: View {
    private let imageURL = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
//        AsyncImage(url: URL(string: imageURL))
        
//        AsyncImage(url: URL(string: imageURL), scale: 3.0)
        AsyncImage(url: URL(string: imageURL), scale: 3.0)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
