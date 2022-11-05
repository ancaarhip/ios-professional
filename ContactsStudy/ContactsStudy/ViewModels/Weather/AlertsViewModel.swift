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
    private var rawAlerts: Alerts?
    
    private let pageLength = 20
    private let offset = 10
    
    var dataService: DataService = WeatherService()
    
    private var cancellable: AnyCancellable?
    
    init() {
        
        cancellable = dataService.getAlerts()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { [unowned self] in
                self.rawAlerts = $0
                loadNextPage(in: 0...10)
            })
    }
    
    func loadNextPage(in range: ClosedRange<Int>) {
        cancellable = rawAlerts?.alerts
            .publisher
            .output(in: range)
        
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
    
    func loadMore(currentItem: AlertModel) {
        
        let index = alerts.firstIndex {
            $0.id == currentItem.id
        } ?? 0
        
        let maxAlertsCount = rawAlerts?.alerts.count ?? 0
        let upperBound = min(alerts.count + pageLength, maxAlertsCount)
        
        if alerts.count >= maxAlertsCount || index >= alerts.count - offset {
            loadNextPage(in: ClosedRange(uncheckedBounds: (alerts.count, upperBound)))
        }
    }
}
