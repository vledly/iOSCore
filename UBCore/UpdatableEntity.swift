//
//  UpdatableEntity.swift
//  UBCore
//
//  Created by Леван Чикваидзе on 21.10.2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//


public struct UpdatableEntity<T: DAOEntity> {
    
    public init() {}
    
    public var update: CountedList<T>?
    public var delete: CountedList<String>?
    public var updateAt: String?
}
