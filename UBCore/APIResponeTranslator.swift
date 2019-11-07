//
//  APIResponeTranslator.swift
//  UBCore
//
//  Created by Леван Чикваидзе on 21.10.2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//


open class APIResponseTranslator<Response: Decodable, Entity: DAOEntity> {
        
    required public init() {}
    
    open func fill(
        _ entity: Entity,
        from dto: Response
    ) throws {}
    
    open func fill(
        _ entities: inout [Entity],
        from dtos: [Response]
    ) throws {}
    
}
