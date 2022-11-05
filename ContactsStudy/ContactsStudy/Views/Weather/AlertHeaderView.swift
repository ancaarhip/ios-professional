//
//  AlertHeaderVIew.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 04.11.2022.
//

import SwiftUI

struct AlertHeaderView: View {
    // MARK: - PROPERTIES
    
    var image: UIImage
    
    @State private var isAnimatingImage: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                .padding(.vertical, 20)
                .scaleEffect(isAnimatingImage ? 1.0 : 0.6)
        } //: ZSTACK
        .frame(height: 440)
        .onAppear() {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimatingImage = true
            }
        }
    }
}

//struct AlertHeaderVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        AlertHeaderVIew()
//            .previewLayout(.fixed(width: 375, height: 440))
//    }
//}
