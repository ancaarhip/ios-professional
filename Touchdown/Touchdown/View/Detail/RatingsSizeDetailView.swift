//
//  RatingsSizeDetailView.swift
//  Touchdown
//
//  Created by Anca Arhip on 12.11.2022.
//

import SwiftUI

struct RatingsSizeDetailView: View {
    
    // MARK: - PROPERTIES
    
    let sizes: [String] = ["XS", "S", "M", "L", "XL"]
    
    // MARK: - BODY
    
    var body: some View {
        HStack(alignment: .top, spacing: 3) {
            // RATINGS
            VStack(alignment: .leading, spacing: 3) {
                Text("Ratings")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(colorGray)
                
                HStack(alignment: .center, spacing: 3) {
                    ForEach(1...5, id: \.self) { item in
                        Button {
                            
                        } label: {
                            Image(systemName: "star.fill")
                                .frame(width: 28, height: 28, alignment: .center)
                                .background(colorGray.cornerRadius(5))
                                .foregroundColor(.white)
                        }
                    }
                } //: HSTACK
            }
            
            Spacer()
            
            //SIZES
            VStack(alignment: .trailing, spacing: 3) {
                Text("Sizes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(colorGray)
                
                HStack(alignment: .center, spacing: 5) {
                    ForEach(sizes, id: \.self) { size in
                        Text(size)
                            .font(.footnote)
                            .fontWeight(.heavy)
                            .foregroundColor(colorGray)
                            .frame(width: 28, height: 28, alignment: .center)
                            .background(Color.white.cornerRadius(5))
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(colorGray, lineWidth: 2)
                            )
                    } //: LOOP
                } //: HSTACK
            } //: VSTACK
        } //: HSTACK
    }
}

struct RatingsSizeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsSizeDetailView()
    }
}
