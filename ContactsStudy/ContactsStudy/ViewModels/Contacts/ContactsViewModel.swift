//
//  ContactsViewModel.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 04.11.2022.
//

import SwiftUI
import Contacts
import Combine

struct GroupedByKeys: Hashable {
    let givenName: String
    let famillyName: String
}

struct ContactsGroup: Hashable {
    var key: GroupedByKeys
    var cards: [CNContact]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(key)
    }
}

@propertyWrapper
struct ContactsViewModel: DynamicProperty {
    
    @ObservedObject private var observer: ContactsService
    
    var wrappedValue: [ContactsGroup] {
        observer.results.reduce([:]) {
            var partialResult = $0
            let key = GroupedByKeys(
                givenName: $1.givenName,
                famillyName: $1.familyName
            )
            var contacts = partialResult[key] ?? []
            contacts.append($1)
            partialResult.updateValue(contacts, forKey: key)
            
            return partialResult
        }
        .filter {
            $0.value.count > 1
        }
        .map {
            ContactsGroup(key: $0.key, cards: $0.value)
        }
    }
    
    init() {
        
        let request = CNContactFetchRequest(
            keysToFetch: [CNContactGivenNameKey, CNContactFamilyNameKey] as [CNKeyDescriptor]
        )
        request.sortOrder = .familyName
        request.unifyResults = false
        
        observer = ContactsService(request)
    }
    
}

@propertyWrapper
struct ContactViewModel: DynamicProperty {
    
    @ObservedObject private var observer: ContactsService
    
    var store: CNContactStore {
        observer.store
    }
    
    var wrappedValue: CNContact? {
        observer.results.first
    }
    
    init(contactId: String) {
        let request = CNContactFetchRequest(
            keysToFetch: Constants.contactKeys as [CNKeyDescriptor]
        )
        request.predicate = CNContact.predicateForContacts(withIdentifiers: [contactId])
        
        observer = ContactsService(request)
    }
    
    func delete() {
        
    }
}
