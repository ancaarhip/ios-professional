//
//  TableViewModel.swift
//  AlertTableUIKit
//
//  Created by Anca Arhip on 07.11.2022.
//

import UIKit

struct AlertModelView {
    let image: UIImage?
    let title: String
    let details: String
}

class TableViewModel: ObservableObject {
    let alerts: Box<[AlertModelView]> = Box([])
    
    var alertsService: AlertsService = AlertsProvider()
    
    var numberOfRows: Int {
        alerts.value.count
    }
    
    init() {
        
        alertsService.getAlerts { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let alerts):
                DispatchQueue.main.async {
                    self.alerts.value = alerts.map {
                        AlertModelView(image: nil, title: $0.event, details: $0.senderName)
                    }
                }
            }
        }
    }
}
