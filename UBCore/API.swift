//
//  API.swift
//  Core
//
//  Created by Леван Чикваидзе on 05/09/2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//

import Moya


public protocol API: TargetType {
    var apiVersion: String { get }
}

extension API {
    
    public var sampleData: Data { return Data() }
    
    var host: String {
        return UBCoreConfigurator.host
    }
    
    public var baseURL: URL {
        return URL(string: host + apiVersion)!
    }
    
    public var baseHeaders: [String : String]? {
        var headers: [String : String] = [:]
        headers["Content-type"] = "application/json"
        headers["Accept"] = "application/json;charset=UTF-8"
        headers["X-Device-Type"] = "IOS"
        
        return headers
    }
    
}
