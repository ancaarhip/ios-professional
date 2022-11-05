//
//  AsyncImageView.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 03.11.2022.
//

import Foundation

import SwiftUI
import Combine

struct ThumbnailImageView: View {

    // MARK: - PROPERTIES
    
    var image: UIImage?
    
    // MARK: - BODY
    
    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .cornerRadius(8)
        } else {
            ProgressView()
        }
    }
}

