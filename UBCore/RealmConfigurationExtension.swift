//
//  RealmConfigurationExtension.swift
//  Core
//
//  Created by Леван Чикваидзе on 05/09/2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//

import Foundation
import RealmSwift
import DAO

extension RealmConfiguration {
    
    private static let onDiskDatabaseFileName: String = "glOnDiskDatabase.realm"
    private static let onDiskDatabaseVersion: UInt64 = 5
    private static let onDiskMigrationBlock: MigrationBlock = { migration, oldSchemeVersion in
        if oldSchemeVersion < onDiskDatabaseVersion {
            
        }
    }
    
    public static let smOnDiskConfiguration = RealmConfiguration(databaseFileName: onDiskDatabaseFileName,
                                                          databaseVersion: onDiskDatabaseVersion,
                                                          migrationBlock: onDiskMigrationBlock)
    
}

extension Realm.Configuration {
    
    private static let inMemoryDatabaseFileName: String = "glInMemoryDatabase.realm"
    
    
    public static let inMemoryConfiguration = Realm.Configuration(inMemoryIdentifier: inMemoryDatabaseFileName)
    
}
