//
//  JSONSerializationExtension.swift
//  Onlinetoure
//
//  Created by Nikita Nikitsky on 25/09/2019.
//  Copyright © 2019 Unitbean. All rights reserved.
//

import Foundation

extension JSONSerialization {

    /**
     Returns a String from given JSON data.

     - Parameters:
        - data: A data object containing JSON data.
        - readOptions: Options for reading the JSON data and creating the Foundation objects.
        - writeOptions: Options for creating the JSON data.
        - encoding: A encoding of string.

     - Returns: A String from the JSON data in data, or nil if an error occurs.
     */
    open class func jsonString(
        with data: Data,
        readOptions: JSONSerialization.ReadingOptions = [],
        writeOptions: JSONSerialization.WritingOptions = [],
        encoding: String.Encoding = .utf8
    ) -> String? {
        guard
            let jsonObject = try? JSONSerialization.jsonObject(with: data, options: readOptions)
        else { return nil }

        return jsonString(with: jsonObject, options: writeOptions, encoding: encoding)
    }

    /**
    Returns String from a Foundation object.

    - Parameters:
       - jsonObject: The object from which to generate String. Must not be nil.
       - options: Options for creating the JSON data.
       - encoding: A encoding of string.

    - Returns: String for obj, or nil if an internal error occurs.
    */
    open class func jsonString(
        with jsonObject: Any,
        options: JSONSerialization.WritingOptions = [],
        encoding: String.Encoding = .utf8
    ) -> String? {
        guard
            let data = try? JSONSerialization.data(withJSONObject: jsonObject, options: options)
        else { return nil }

        return String(data: data, encoding: encoding)
    }

}
