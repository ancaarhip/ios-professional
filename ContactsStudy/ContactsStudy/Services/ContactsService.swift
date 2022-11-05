//
//  ContactsService.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 04.11.2022.
//

import Foundation
import Combine
import Contacts


class ContactsService: ObservableObject {
    
    @Published var results: [CNContact] = []
    
    let store = CNContactStore()
    private let request: CNContactFetchRequest
    
    private var queue = DispatchQueue(label: "com.aaqueue.contacts")
    
    private var cancellable: AnyCancellable?
    
    init(_ request: CNContactFetchRequest) {
        self.request = request
        
        self.cancellable = NotificationCenter.default
            .publisher(for: Notification.Name.CNContactStoreDidChange)
            .sink { [weak self] _ in
                guard let self = self else { return }

                self.fetch()
            }
        fetch()
    }
    
    private func fetch() {
        queue.async { [weak self] in
            guard let self = self else { return }
            
            var contacts: [CNContact] = []
            
            defer {
                DispatchQueue.main.async {
                    self.results = contacts
                }
            }
            
            do {
                try self.store.enumerateContacts(with: self.request) { contact, _ in
                    contacts.append(contact)
                }
            } catch {
                print(error)
            }
        }
    }
}
