//
//  AlertViewModel.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 04.11.2022.
//

import SwiftUI

struct AlertModel: Identifiable {
    var id = UUID()
    var event: String
    var senderName: String
    var dateOnset: Date
    var dateEnds: Date?
    var severity: String
    var certainty: String
    var urgency: String
    var description: String
    var affectedZones: [AffectedZoneModel]
    var alertImage: UIImage? = nil
    
    init(alert: Alert, imageData: Data? = nil) {
        self.event = alert.event
        self.senderName = alert.senderName
        self.dateOnset = alert.dateOnset
        self.dateEnds = alert.dateEnds
        self.severity = alert.severity
        self.certainty = alert.certainty
        self.urgency = alert.urgency
        self.description = alert.description
        self.affectedZones = alert.affectedZoneIDs.map {
            AffectedZoneModel($0)
        }
        if let imageData = imageData {
            self.alertImage = UIImage(data: imageData)
        }
    }
    
    mutating func setZone(id: String, name: String) {
        if let index = affectedZones.firstIndex(where: { $0.id == id }) {
            affectedZones[index].name = name
        }
    }
}

struct AffectedZoneModel {
    var id: String
    var type: String
    var name: String = ""
    
    init(_ affectedZone: AffectedZone) {
        self.id = affectedZone.id
        self.type = affectedZone.type
    }
}
