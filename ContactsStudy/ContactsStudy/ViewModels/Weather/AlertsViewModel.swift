//
//  AlertsViewModel.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 03.11.2022.
//

import Foundation
import Combine

class AlertsViewModel: ObservableObject {

    @Published var alerts: [AlertModel] = []
    
    var dataService: DataService = WeatherService()
    
    private var cancellable: AnyCancellable?
    
    init() {
        
        cancellable = dataService.getAlerts()
            .map(\.alerts)
            
            .flatMap { alerts in
                alerts.publisher.setFailureType(to: Error.self)
            }
            .flatMap { [unowned self] alert in
                self.dataService.getImage()
                    .map { data in
                        AlertModel(alert: alert, imageData: data)
                    }
            }
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { [unowned self] in
                self.alerts.append($0)
            })

    }
    
}
