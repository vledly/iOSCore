//
//  HTTPJSONDataStringifier.swift
//  UBCore
//
//  Created by Nikita Nikitsky on 09.10.2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//

import Foundation

/// The stringifier for HTTP JSON data.
public struct HTTPJSONDataStringifier {

    private let readOptions: JSONSerialization.ReadingOptions
    private let writeOptions: JSONSerialization.WritingOptions
    private let encoding: String.Encoding

    init(
        readOptions: JSONSerialization.ReadingOptions = [],
        writeOptions: JSONSerialization.WritingOptions = [],
        encoding: String.Encoding = .utf8
    ) {
        self.readOptions = readOptions
        self.writeOptions = writeOptions
        self.encoding = encoding
    }

}

// MARK: - HTTPDataStringifier

extension HTTPJSONDataStringifier: HTTPDataStringifier {

    public func string(
        with data: Data?
    ) -> String? {
        guard let data = data else { return nil }
        
        return JSONSerialization.jsonString(with: data, readOptions: readOptions, writeOptions: writeOptions, encoding: encoding)
    }

}
