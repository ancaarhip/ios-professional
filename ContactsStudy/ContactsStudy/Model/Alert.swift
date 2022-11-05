//
//  AlertModel.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 03.11.2022.
//

import Foundation

struct Alerts: Codable {
    var alerts: [Alert]
}

struct Alert: Codable {
    var id: String
    var event: String
    var senderName: String
    var dateOnset: Date
    var dateEnds: Date?
    var severity: String
    var certainty: String
    var urgency: String
    var description: String
    var affectedZoneIDs: [AffectedZone]
}

struct AffectedZone: Codable {
    var id: String
    var type: String
}

struct Zone: Codable {
    var id: String
    var name: String
}

