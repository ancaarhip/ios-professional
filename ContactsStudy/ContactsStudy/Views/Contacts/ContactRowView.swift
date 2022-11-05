//
//  ContactRowView.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 05.11.2022.
//

import SwiftUI
import Contacts

struct ContactRowView: View {
    
    // MARK: - PROPERTIES
    
    var label: String
    var value: String
    var type: DetailType
    
    // MARK: - BODY
    
    var body: some View {
        if !value.isEmpty {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(CNLabeledValue<NSString>.localizedString(forLabel: label))
                        .font(.footnote)
                        .foregroundColor(.primary.opacity(0.8))
                    switch type {
                    case .text:
                        Text(value)
                    case .tel:
                        Link(
                            destination:
                                URL(string: "tel:\(value.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? value)")!
                            )
                        {
                            Text(value)
                        }
                    case .email:
                        Link(destination: URL(string: "mailto:\(value as String)")!) {
                            Text(value as String)
                        }
                    case .url:
                        Link(destination: URL(string: value as String)!) {
                            (
                                Text(value as String )
                            )
                        }
                    }
                } //: VSTACK
                .padding(.vertical, 5)

                Spacer(minLength: 0)
            } //: HSTACK
        }
    }
}

struct ContactRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContactRowView(label: "Label", value: "Value", type: .text)
    }
}
