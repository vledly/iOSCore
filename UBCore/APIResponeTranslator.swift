//
//  APIResponeTranslator.swift
//  UBCore
//
//  Created by Леван Чикваидзе on 21.10.2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//


public class APIResponseTranslator<Response: Decodable, Entity: DAOEntity> {
        
    public func fill(
        _ entity: Entity,
        from dto: Response
    ) throws {}
    
    public func fill(
        _ entities: inout [Entity],
        from dtos: [Response]
    ) throws {}
    
}
