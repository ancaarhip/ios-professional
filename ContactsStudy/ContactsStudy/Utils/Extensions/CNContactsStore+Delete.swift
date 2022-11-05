//
//  CNContactsStore+Delete.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 05.11.2022.
//

import Foundation
import Contacts

extension CNContactStore {
    func deleteContact(contact: CNContact?) throws {
        guard let contact = contact?.mutableCopy() as? CNMutableContact
        else { return }
        
        let request = CNSaveRequest()
        request.delete(contact)
        
        try self.execute(request)
        
    }
}
