//
//  DefaultsStorage.swift
//  UBCore
//
//  Created by Леван Чикваидзе on 26/09/2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//

import Foundation.NSUserDefaults


/// Wrapper для shared instance Foundation.NSUserDefaults.
public class DefaultsStorage {
    
    /// Shared instance для key-value хранилища, предоставляемого Apple's Foundation.
    /// Ссылка на документацию:
    /// https://developer.apple.com/documentation/foundation/userdefaults (Cmd + click)
    private let userDefaults: UserDefaults
    
    
    /// Добавляет значение в хранилище
    ///
    /// - Parameters:
    ///   - value: Значение для сохранения. Принимает тип передаваемого значения.
    ///   - keyContainer: Контейнер с ключом для передаваемого значения. Тип контейнера должен
    ///   соответствовать протоколу `KVStorageKeyContainer`.
    ///
    ///   Для этого можно использовать enum.
    ///
    ///   Например:
    ///
    ///   enum DefaultsKey: KVStorageKeyContainer {
    ///       case cityId
    ///       case catalogUpdate
    ///       ...
    ///
    ///       func keyForValue() -> String {
    ///          return String(describing: self)
    ///       }
    ///   }
    ///
    ///   let value = DefaultsStorage.Value(
    ///         value: some,
    ///         keyContainer: DefaultsKey.cityId
    ///    )
    ///
    public func persist<T>(
        value: T,
        keyContainer: KVStorageKeyContainer
    ) {
        userDefaults.set(
            value,
            forKey: keyContainer.keyForValue()
        )
    }
    
    /// Возвращает из хранилища значение по ключу из переданного контейнера.
    ///
    /// - Parameters:
    ///   - keyContainer: Контейнер с ключом для передаваемого значения. Тип контейнера должен
    ///     соответствовать протоколу `KVKeyContainer`.
    /// - Returns:
    ///     Опциональное значение ожидаемого типа.
    ///
    public func fetch<T>(_ keyContainer: KVStorageKeyContainer) -> T? {
        
        let keyString = keyContainer.keyForValue()
        
        return userDefaults.object(forKey: keyString) as? T
    }
    
    public func delete(_ keyContainer: KVStorageKeyContainer) {
        userDefaults.set(
            .none,
            forKey: keyContainer.keyForValue()
        )
    }
    
    public init(
        userDefaults: UserDefaults = .standard
    ) {
        self.userDefaults = userDefaults
    }
    
}
