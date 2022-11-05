//
//  AffectedZonesView.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 04.11.2022.
//

import SwiftUI

struct AffectedZonesView: View {
    
    // MARK: - PROPERTIES
    
    @StateObject var affectedZones: ZonesViewModel
    
    // MARK: - BODY
    
    var body: some View {
        GroupBox() {
            DisclosureGroup("Affected zones") {
                ForEach(affectedZones.zones, id: \.id) { item in
                    Divider()
                        .padding(.vertical, 2)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(item.name)
                        }
                        .font(Font.system(.body).bold())
                        
                        Spacer(minLength: 25)
                        
                        Text(item.name)
                            .multilineTextAlignment(.trailing)
                    } //: HSTACK
                } //: FOR
            } //: GROUP
        } //: BOX
        .onAppear {
            
        }
    }
}

//struct AffectedZonesView_Previews: PreviewProvider {
//    static var previews: some View {
//        AffectedZonesView()
//            .preferredColorScheme(.dark)
//            .previewLayout(.fixed(width: 375, height: 480))
//            .padding()
//    }
//}
