//
//  HTTPDataStringifier.swift
//  UBCore
//
//  Created by Nikita Nikitsky on 09.10.2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//

import Foundation

/// The stringifier for HTTP data.
public protocol HTTPDataStringifier {

    /**
     Returns a String for given HTTP data.

     - Parameters:
        - data: HTTP data for stringify.

     - Returns: A String from the HTTP data, or nil if an error occurs.
     */
    func string(
        with data: Data?
    ) -> String?

}
