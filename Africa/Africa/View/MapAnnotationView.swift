//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Anca Arhip on 11.11.2022.
//

import SwiftUI

struct MapAnnotationView: View {
    
    // MARK: - PROPERTIES
    
    var location: NationalParkLocation
    
    @State private var animation: Double = 0.0
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width:54, height: 54)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width:48, height: 48, alignment: .center)
            .clipShape(Circle())
        } //: ZSTACK
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var location: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    static var previews: some View {
        MapAnnotationView(location: location[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
