//
//  UpdatableEntity.swift
//  Business
//
//  Created by Леван Чикваидзе on 26/09/2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//


struct UpdatableEntity<T: Decodable>: Decodable {
    var delete: CountedList<String>?
    var update: CountedList<T>?
    var updateAt: String?
}
