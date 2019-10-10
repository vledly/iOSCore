//
//  KVStorageKeyContainer.swift
//  UBCore
//
//  Created by Леван Чикваидзе on 10/10/2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//


/// Объявляет метод keyForValue(), возвращающий ключ для значения в каком-либо Key-Value хранилища.
public protocol KVStorageKeyContainer {
    func keyForValue() -> String
}
