//
//  NetworkStackTypes.swift
//  UBCore
//
//  Created by Леван Чикваидзе on 11/09/2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//

import Moya


public typealias Provider<T: TargetType> = MoyaProvider<T>
public typealias Task = Moya.Task
public typealias Method = Moya.Method
public typealias URLEncoding = Moya.URLEncoding
public typealias JSONEncoding = Moya.JSONEncoding
