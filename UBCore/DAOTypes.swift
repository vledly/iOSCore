//
//  DAOTypes.swift
//  UBCore
//
//  Created by Леван Чикваидзе on 11/09/2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//

import DAO
import RealmSwift


public typealias CoreDAO<Entity: Entity> = DAO<Entity>
public typealias CoreDAOImpl = RealmDAO
public typealias DAOTranslator<Entity: Entity, Entry: RLMEntry> = RealmTranslator<Entity, Entry>
public typealias DAOEntity = Entity
public typealias DAOEntry = RLMEntry

// MARK: - Realm

public typealias DBList = List
public typealias DBOptional = RealmOptional
