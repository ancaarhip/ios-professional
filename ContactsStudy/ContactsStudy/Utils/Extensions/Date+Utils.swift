//
//  Date+Utils.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 03.11.2022.
//

import Foundation

extension Date {
    func alertFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        return formatter.string(from: self)
    }
}
