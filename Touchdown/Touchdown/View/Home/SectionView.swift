//
//  SectionView.swift
//  Touchdown
//
//  Created by Anca Arhip on 12.11.2022.
//

import SwiftUI

struct SectionView: View {
    
    // MARK: - PROPERTIES
    
    @State var rotateClockWise: Bool
    // MARK: - BODY
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Categories".uppercased())
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: rotateClockWise ? 90 : -90))
            
            Spacer()
        } //: VSTACK
        .background(colorGray.cornerRadius(12))
        .frame(width: 85)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(rotateClockWise: true)
            .previewLayout(.fixed(width: 120, height: 240))
            .padding()
            .background(colorBackground)
    }
}
