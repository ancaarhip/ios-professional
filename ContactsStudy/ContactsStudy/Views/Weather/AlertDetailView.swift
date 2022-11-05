//
//  AlertDetailView.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 03.11.2022.
//

import SwiftUI

struct AlertDetailView: View {
    // MARK: - PROPERTIES
    
    var alert: AlertModel
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 5) {
                    // HEADER
                    if let image = alert.alertImage {
                        AlertHeaderView(image: image)
                            .padding(.leading)
                            .padding(.trailing)
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        // START AND END DATE
                        StackLabelView(label: "From:", value: alert.dateOnset.alertFormat())
                        StackLabelView(label: "To:", value: alert.dateEnds?.alertFormat() ?? "...")

                        // SEVERITY
                        StackLabelView(label: "Severity:", value: alert.severity)
                                            
                        // CERTAINTY
                        StackLabelView(label: "Certainty:", value: alert.certainty)
                        
                        // URGENCY
                        StackLabelView(label: "Urgency:", value: alert.urgency)
                        
                        // SOURCE
                        StackLabelView(label: "Source:", value: alert.senderName)
                        
                        // AFFECTED ZONES
                        AffectedZonesView(affectedZones: ZonesViewModel(alert))
                        
                        // DESCRIPTION
                        Text(alert.description)
                            .font(.system(size: 16))
                            .multilineTextAlignment(.leading)
                        
                    } //: VSTACK
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                } //: VSTACK
                .navigationBarTitle(alert.event, displayMode: .inline)
                .navigationBarHidden(true)
            } //: SCROLL
        } //: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            
        }
    }
}


