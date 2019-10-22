//
//  CountedListAPIResponseTranslator.swift
//  UBCore
//
//  Created by Леван Чикваидзе on 21.10.2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//


public class CountedListAPIResponseTranslator<Response: Decodable, Entity: DAOEntity> {
    
    public func fill(
        _ entity: inout CountedList<Entity>,
        from dto: CountedListApiDTO<Response>,
        entityTranslator: APIResponseTranslator<Response, Entity>
    ) throws {
        
        entity.count = dto.count ?? 0
        
        if let items = dto.items {
            try entityTranslator.fill(&entity.items, from: items)
        }
    }
    
}
