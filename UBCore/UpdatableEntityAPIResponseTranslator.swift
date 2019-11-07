//
//  UpdatableEntityAPIResponseTranslator.swift
//  UBCore
//
//  Created by Леван Чикваидзе on 21.10.2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//


public final class UpdatableEntityAPIResponseTranslator<Response: Decodable, Entity: DAOEntity> {
    
    public required init() {}
    
    public func fill(
        _ entity: inout UpdatableEntity<Entity>,
        from dto: UpdatableResponse<Response>,
        entityTranslator: APIResponseTranslator<Response, Entity>
    ) throws {
        
        entity.updateAt = dto.updateAt
        
        if let update = dto.update {
            var list = CountedList<Entity>()
            try CountedListAPIResponseTranslator<Response, Entity>().fill(
                &list,
                from: update,
                entityTranslator: entityTranslator
            )
            entity.update = list
        }
        
        if let delete = dto.delete {
            let list = CountedList<String>()
            list.count = delete.count ?? 0
            list.items = delete.items ?? []
            entity.delete = list
        }
        
    }
    
    public func fill(
        _ entities: inout [UpdatableEntity<Entity>],
        from dtos: [UpdatableResponse<Response>]
    ) {}
    
}
