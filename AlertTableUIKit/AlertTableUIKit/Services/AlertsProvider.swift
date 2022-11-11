//
//  AlertsProvider.swift
//  AlertTableUIKit
//
//  Created by Anca Arhip on 07.11.2022.
//

import Foundation

enum NetworkError: Error {
    case badUrl, serverError, decodingError
}


protocol AlertsService {
    func getAlerts(completion: @escaping (_ result: Result<[Alert], Error>) -> Void)
}

struct AlertsProvider: AlertsService {
    let url = URL(string: "http://api.alltheapps.org/weather/v3/allActiveAlerts?apiKey=aa221028")
    
    func getAlerts(completion: @escaping (_ result: Result<[Alert], Error>) -> Void) {
        
        guard let url = url else {
            return completion(.failure(NetworkError.badUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                return completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let alerts = try JSONDecoder().decode(Alerts.self, from: data)
                    return completion(.success(alerts.alerts))
                } catch {
                    return completion(.failure(NetworkError.decodingError))
                }
            }
            
            return completion(.failure(NetworkError.serverError))
        }
        .resume()
    }
    
    
    
}
