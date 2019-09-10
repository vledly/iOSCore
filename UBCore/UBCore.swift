//
//  UBCore.swift
//  UBCore
//
//  Created by Леван Чикваидзе on 11/09/2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//


public class UBCore {
    
    private static var configHost: String?
    
    public static var host: String {
        get {
            guard let hostValue = configHost else {
                let errorMessage = "Для работы с network stack UBCore необходимо определить параметр host. Используйте UBCore.initialize(with config: UBCoreConfiguration)"
                fatalError(errorMessage)
            }
            
            return hostValue
        }
    }
    
    open class func initialize(with config: UBCoreConfiguration) {
        configHost = config.host
    }

}
