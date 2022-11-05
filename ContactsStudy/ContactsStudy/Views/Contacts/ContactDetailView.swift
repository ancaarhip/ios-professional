//
//  ContactDetailView.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 05.11.2022.
//

import SwiftUI
import Contacts

struct ContactDetailView: View {
    
    // MARK: - PROPERTIES
    
    @ContactViewModel private var contact: CNContact?
    
    @State private var deletePrompt: Bool = false
    @State private var error: Error?
    
    // MARK: FUNCTIONS
    
    init(contactId: String) {
        _contact = ContactViewModel(contactId: contactId)
    }
    
    private func delete() {
        do {
            try _contact.store.deleteContact(contact: contact)
        } catch {
            self.error = error
        }
    }
    
    // MARK: - BODY
    
    var body: some View {
        if let contact = contact {
            List {
                nameSection(for: contact)
                numbers(for: contact)
                emails(for: contact)
                urls(for: contact)
                
                // ETC....
                
                Button {
                    deletePrompt = true
                } label: {
                    HStack { Spacer(); Text("Delete").foregroundColor(.red); Spacer() }
                }
                .actionSheet(isPresented: $deletePrompt) {
                    ActionSheet(
                        title: Text("Delete"),
                        message: Text("Are you sure?"),
                        buttons: [
                            .destructive( Text("Delete"), action: delete),
                            .cancel()
                        ]
                    )
                }
            } //: LIST
            // TO DO : display error message
        } else {
            Text("Contact not found")
        }
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contactId: "")
    }
}
