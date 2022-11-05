//
//  ContactsView.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 03.11.2022.
//

import SwiftUI

struct ContactsView: View {
    
    // MARK: - PROPERTIES
    
    @ContactsViewModel private var contactGroups
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contactGroups, id: \.key) { group in
                    DisclosureGroup {
                        ForEach(group.cards, id: \.self) { contact in
                            NavigationLink {
                                ContactDetailView(contactId: contact.identifier)
                            } label: {
                                GroupRowView(contact: contact)
                            }
                        }
                    } label: {
                        Text("\(group.key.givenName) \(group.key.famillyName)")
                    }
                }
            } //: LIST
            .navigationBarTitle("Contacts", displayMode: .inline)
        } //: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    // FUNCTIONS
    
    init() {
        _contactGroups = ContactsViewModel()
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
