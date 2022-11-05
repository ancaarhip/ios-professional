//
//  WeatherRowView.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 03.11.2022.
//

import SwiftUI

struct AlertRowView: View {
    
    // MARK: - PROPERTIES
    
    var alertModel: AlertModel
    
    @State var imageData: Data?
    
    // MARK: - BODY
    
    var body: some View {
        HStack {
            ThumbnailImageView(image: alertModel.alertImage)
                
            VStack(alignment: .leading, spacing: 5) {
                Text(alertModel.event)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                Text("""
                     From: \(alertModel.dateOnset.alertFormat())
                     To: \(alertModel.dateEnds?.alertFormat() ?? "...")
                     """
                )
                    .font(.system(size: 16))
                    
                Text(alertModel.senderName)
                    .font(.caption)
                    .foregroundColor(Color.secondary)
            } //: VSTACK
        } //: HSTACK
    }
}
