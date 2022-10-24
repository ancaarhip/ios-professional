//
//  ContentView.swift
//  SwiftUIAsyncImage
//
//  Created by Anca Arhip on 21.10.2022.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModfier() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
    
    private let imageURL = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
//        AsyncImage(url: URL(string: imageURL))
        
//        AsyncImage(url: URL(string: imageURL), scale: 3.0)
//        AsyncImage(url: URL(string: imageURL), scale: 3.0) { image in
//            image.imageModifier()
//
//        } placeholder: {
//            Image(systemName: "photo.circle.fill").iconModfier()
//
//        }
//        .padding(40)
//        AsyncImage(url: URL(string: imageURL)) { phase in
//            // success
//            // failure
//            // empty
//            if let image = phase.image {
//                image.imageModifier()
//            } else if phase.error != nil {
//                Image(systemName: "ant.circle.fill").iconModfier()
//            } else {
//                Image(systemName: "photo.circle.fill").iconModfier()
//            }
//        }
//        .padding()
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image.imageModifier()
//                    .transition(.move(edge: .bottom))
//                    .transition(.slide)
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModfier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModfier()
            @unknown default:
                ProgressView()
            }
        
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
