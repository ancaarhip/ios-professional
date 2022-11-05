//
//  NetworkService.swift
//  ContactsStudy
//
//  Created by Anca Arhip on 03.11.2022.
//

import Foundation
import Combine

protocol DataService {
    func getAlerts() -> AnyPublisher<Alerts, Error>
    func getImage() -> AnyPublisher<Data, Error>
    func getZone(id: String, type: String) -> AnyPublisher<Zone, Error>
}

struct WeatherService: DataService {
    
    var http = Http()
    
    func getAlerts() -> AnyPublisher<Alerts, Error> {
        
        guard var urlComponents = URLComponents(url: Constants.baseUrl, resolvingAgainstBaseURL: false)
        else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        urlComponents.path.append("\(Constants.activeAlerts)")
        
        urlComponents.queryItems = [
            URLQueryItem(name: "apiKey", value: Constants.apiKey),
        ]
        
        guard let url = urlComponents.url else {
            return Fail(error: NetworkError.invalidQuery).eraseToAnyPublisher()
        }
        
        return http.get(url)
    }
    
    func getImage() -> AnyPublisher<Data, Error> {
        return http.getData(Constants.imageUrl)
            
    }
    
    func getZone(id: String, type: String) -> AnyPublisher<Zone, Error> {
        
        guard var urlComponents = URLComponents(url: Constants.baseUrl, resolvingAgainstBaseURL: false)
        else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        urlComponents.path.append("\(Constants.alertZone)")
        
        urlComponents.queryItems = [
            URLQueryItem(name: "apiKey", value: Constants.apiKey),
            URLQueryItem(name: "id", value: id),
            URLQueryItem(name: "type", value: type),
        ]
        
        guard let url = urlComponents.url else {
            return Fail(error: NetworkError.invalidQuery).eraseToAnyPublisher()
        }
        
        return http.get(url)
    }
}
