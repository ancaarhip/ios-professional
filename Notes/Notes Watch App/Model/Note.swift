//
//  Note.swift
//  Notes Watch App
//
//  Created by Anca Arhip on 16.11.2022.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
