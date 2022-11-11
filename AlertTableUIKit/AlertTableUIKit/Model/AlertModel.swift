//
//  AlertModel.swift
//  AlertTableUIKit
//
//  Created by Anca Arhip on 07.11.2022.
//

import Foundation

struct Alerts: Decodable {
    let alerts: [Alert]
}

struct Alert: Decodable {
    let event: String
    let senderName: String
}
