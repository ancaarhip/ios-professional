//
//  StackLabelView.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 04.11.2022.
//

import SwiftUI

struct StackLabelView: View {
    
    // MARK: - PROPERTIES
    
    var label: String
    var value: String
    
    // MARK: - BODY
    
    var body: some View {
        HStack {
            Text(label)
                .font(.system(size: 16))
                .fontWeight(.bold)
            Spacer()
            Text(value)
                .font(.system(size: 16))
        }
    }
}

struct StackLabelView_Previews: PreviewProvider {
    static var previews: some View {
        StackLabelView(label: "Label", value: "Value")
            .scaledToFit()
    }
}
