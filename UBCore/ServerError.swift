//
//  NetworkError.swift
//  Core
//
//  Created by Леван Чикваидзе on 02/09/2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//


public struct ServerError: Decodable {

    public struct PresentationData: Decodable {
        public let title    : String?
        public let message  : String
    }

    public let domain           : String
    public let details          : String
    public let presentationData : PresentationData
    
}
