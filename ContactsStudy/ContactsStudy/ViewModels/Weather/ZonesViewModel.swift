//
//  ZonesViewModel.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 03.11.2022.
//

import SwiftUI
import Combine


class ZonesViewModel: ObservableObject {

    @Published var zones: [Zone] = []
    
    var dataService: DataService = WeatherService()
    
    private var cancellable: Set<AnyCancellable> = []
    
    init(_ alert: AlertModel) {
        
        let zonePublishers = alert.affectedZones.map {
            dataService.getZone(id: $0.id, type: $0.type)
        }
        
        Publishers.Sequence(sequence: zonePublishers)
            .setFailureType(to: Error.self)
            .flatMap { $0 }
            .collect()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { [unowned self] in
                $0.map { zone in
                    self.zones.append(zone)
                }
            })
            .store(in: &cancellable)

    } 
}

