//
//  NetworkError.swift
//  Core
//
//  Created by Леван Чикваидзе on 02/09/2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//


public struct ServerError: Decodable {
    public let domain  : String = ""
    public let details : String = ""
    public var message : String = "Произошла ошибка"
}
