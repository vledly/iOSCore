//
//  CoreAuthError.swift
//  UBCore
//
//  Created by Nikita Nikitsky on 22.11.2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//


public enum CoreAuthError: Error, Equatable {
    case unauthorized
    case forbidden
}
