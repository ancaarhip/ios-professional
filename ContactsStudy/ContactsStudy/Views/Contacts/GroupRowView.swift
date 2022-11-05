//
//  GroupRowView.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 05.11.2022.
//

import SwiftUI
import Contacts

struct GroupRowView: View {
    
    // MARK: - PROPERTIES
    
    var contact: CNContact
    
    // MARK: - BODY
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .foregroundColor(.accentColor)
            Text(contact.givenName)
                .fontWeight(.semibold)
                + Text(" " + contact.familyName)
        }
    }
}

