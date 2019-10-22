//
//  APIRequestTranslator.swift
//  UBCore
//
//  Created by Леван Чикваидзе on 21.10.2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//


public class APIRequestTranslator<Request: Encodable, Entity: DAOEntity> {
    
    public func fill(
        _ dto: inout Request,
        from entity: Entity
    ) {}
    
}
