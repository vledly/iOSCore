//
//  EncodableExtension.swift
//  Core
//
//  Created by Леван Чикваидзе on 05/09/2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//

import Foundation


extension Encodable {
    
    public var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    
    
    
}
