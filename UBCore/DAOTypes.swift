//
//  DAOTypes.swift
//  UBCore
//
//  Created by Леван Чикваидзе on 11/09/2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//

import DAO
import RealmSwift


public typealias CoreDAO<DEntity: Entity> = DAO<DEntity>
public typealias CoreDAOImpl = RealmDAO
public typealias DAOTranslator<DEntity: Entity, Entry: RLMEntry> = RealmTranslator<DEntity, Entry>
public typealias DAOEntity = Entity
public typealias DAOEntry = RLMEntry

// MARK: - Realm
public typealias DBList = List
public typealias DBOptional = RealmOptional
