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
    case server(code: Int)
    case unknown
    
    public var localizedDescription: String {
        switch self {
        case .reachabilityLost:
            return "Соединение разорвано. Проверьте подключение к интернету."
        case .serialization, .server, .unknown:
            return "Произошла ошибка"
        }
    }
    
    public var statusCode: Int? {
        switch self {
        case let .server(code): return code
        default: return .none
        }
    }
}


// MARK: - Equatable
extension CoreNetworkError: Equatable {
    public static func ==(lhs: CoreNetworkError, rhs: CoreNetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.reachabilityLost, .reachabilityLost):
            return true
        case (.serialization, .serialization):
            return true
        case (.unknown, .unknown):
            return true
        case let (.server(lhsCode), .server(rhsCode)):
            return lhsCode == rhsCode
        default:
            return false
        }
    }
}
