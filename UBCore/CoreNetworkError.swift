//
//  NetworkError.swift
//  Infrastructure
//
//  Created by Леван Чикваидзе on 04/09/2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//


public enum CoreNetworkError: Error {
    case reachabilityLost
    case serialization
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .reachabilityLost: return "Соединение разорвано. Проверьте подключение к интернету."
        case .serialization, .unknown: return "Произошла ошибка"
        }
    }
}
