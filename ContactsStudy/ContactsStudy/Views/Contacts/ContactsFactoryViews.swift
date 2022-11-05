//
//  ContactsFactoryViews.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 05.11.2022.
//

import SwiftUI
import Contacts

enum DetailType{
    case text, tel, email, url
}

extension ContactDetailView {
    
    @ViewBuilder
    func nameSection(for contact: CNContact) -> some View {
        Section {
            ContactRowView(label: "given name", value: contact.givenName, type: .text)
            ContactRowView(label: "middle name", value: contact.middleName, type: .text)
            ContactRowView(label: "family name", value: contact.familyName, type: .text)
            ContactRowView(label: "nickname", value: contact.nickname, type: .text)
        }
    }
    
    @ViewBuilder
    func numbers(for contact: CNContact) -> some View {
        if !contact.phoneNumbers.isEmpty {
            Section {
                ForEach(contact.phoneNumbers, id: \.identifier) { number in
                    ContactRowView(label: number.label ?? "other", value: number.value.stringValue, type: .tel)
                }
            }
        }
    }

    @ViewBuilder
    func emails(for contact: CNContact) -> some View {
        if !contact.emailAddresses.isEmpty {
            Section {
                ForEach(contact.emailAddresses, id: \.identifier) { email in
                    ContactRowView(label: email.label ?? "other", value: email.value as String, type: .tel)
                }
            }
        }
    }

    @ViewBuilder
    func urls(for contact: CNContact) -> some View {
        if !contact.urlAddresses.isEmpty {
            Section {
                ForEach(contact.urlAddresses, id: \.identifier) { url in
                    ContactRowView(label: url.label ?? "other", value: url.value as String, type: .tel)
                }
            }
        }
    }


}
