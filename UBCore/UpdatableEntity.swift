//
//  UpdatableEntity.swift
//  UBCore
//
//  Created by Леван Чикваидзе on 21.10.2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//


public class UpdatableEntity<T: DAOEntity> {
    public var update: CountedList<T>?
    public var delete: CountedList<String>?
    public var updateAt: String?
}
