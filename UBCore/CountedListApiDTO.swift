//
//  CountedListApiDTO.swift
//  Models
//
//  Created by Леван Чикваидзе on 05/09/2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//


public struct CountedListApiDTO<T: Decodable>: Decodable {
    public var count: Int?
    public var items: [T]?
}
