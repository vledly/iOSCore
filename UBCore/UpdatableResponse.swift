//
//  UpdatableResponse.swift
//  Business
//
//  Created by Леван Чикваидзе on 26/09/2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//


public struct UpdatableResponse<T: Decodable>: Decodable {
    var delete: CountedListApiDTO<String>?
    var update: CountedListApiDTO<T>?
    var updateAt: String?
}
