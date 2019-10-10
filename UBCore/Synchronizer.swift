//
//  Synchronizer.swift
//  UBCore
//
//  Created by Леван Чикваидзе on 27/09/2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//


/// Протокол с реализацией синхронизации данных модели `UpdatableEntity`, полученных с сервера, с локальным хранилищем.
/// Использует `DefaultsStorage` для сохранения данных о времени последнего обновления сущностей.

protocol Synchronizer {
    associatedtype Entity: DAOEntity & Decodable
    var dao: CoreDAO<Entity> { get }
    var defaultsStorage: DefaultsStorage { get }
}

extension Synchronizer {
    
    /// Синхронизирует полученные данные `UpdatableEntity` с локальной базой данных. Может бросить исключение.
    ///
    /// - Parameters:
    ///   - entity: полученная с сервера `UpdatableEntity`.
    ///   - storageKey: Ключ `DefaultsStorage` для актуализации данных об обновлении сущеости.
    
    func synchronize(entity: UpdatableEntity<Entity>, storageKey: KVStorageKeyContainer) throws {
        
        do {
            if let itemsToUpdate = entity.update?.items {
                try dao.persist(itemsToUpdate)
            }
            
            if let itemsIdsToDelete = entity.delete?.items {
                try itemsIdsToDelete.forEach {
                    try dao.erase($0)
                }
            }

            defaultsStorage.persist(
                value: entity.updateAt,
                keyContainer: storageKey
            )
            
        } catch {
            try erase(storageKey: storageKey)
            
            throw CoreNetworkError.unknown
        }
    }
    
    /// Удаляет сущность из локальной базы данных и данные об обновлении сущности из `DefaultsStorage`.
    /// - Parameters:
    ///   - storageKey: Ключ `DefaultsStorage` для актуализации данных об обновлении сущеости.
    
    func erase(storageKey: KVStorageKeyContainer) throws {
        defaultsStorage.delete(storageKey)
        try dao.erase()
    }
    
}
