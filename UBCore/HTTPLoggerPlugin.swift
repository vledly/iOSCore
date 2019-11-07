//
//  HTTPLoggerPlugin.swift
//  UBCore
//
//  Created by Nikita Nikitsky on 09.10.2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//

import Moya

/// Logs http activity (outgoing requests and incoming responses).
public final class HTTPLoggerPlugin {

    private let stringifier: HTTPDataStringifier

    public init(
        stringifier: HTTPDataStringifier
    ) {
        self.stringifier = stringifier
    }

}

extension HTTPLoggerPlugin: PluginType {

    public func willSend(
        _ request: RequestType,
        target: TargetType
    ) {
        let log = logHTTPRequest(request, for: target)

        print(log)
    }

    public func didReceive(
        _ result: Result<Response, MoyaError>,
        target: TargetType
    ) {
        let log: [String]

        switch result {
        case let .success(response):
            log = logHTTPResponse(response, forTarget: target)
        case let .failure(error) where error.response != nil:
            log = logHTTPResponse(error.response!, forTarget: target)
        case let .failure(error):
            log = logHTTPError(error, forTarget: target)
        }

        print(log)
    }

}

// MARK: - Logging

extension HTTPLoggerPlugin {

    private func logHTTPRequest(_ request: RequestType, for target: TargetType) -> [String] {
        var log = [String]()
        log.append("HTTP Request for \(target)")

        guard
            let url = request.request?.url?.absoluteString,
            let headers = request.request?.headers.dictionary,
            let method = request.request?.httpMethod
        else {
            log.append("Message: Invalid request")

            return log
        }

        log.append("URL: \(url)")
        log.append("Headers: \(headers)")
        log.append("Method: \(method)")

        if let data = stringifier.string(with: request.request?.httpBody) {
            log.append("Body: \(data)")
        }

        return log
    }

    private func logHTTPResponse(
        _ response: Response,
        forTarget target: TargetType
    ) -> [String] {
        var log = [String]()
        log.append("HTTP Response for \(target)")

        guard
            let url = response.request?.url?.absoluteString,
            let headers = response.response?.headers.dictionary,
            let method = response.request?.httpMethod
        else {
            log.append("Message: Invalid response")

            return log
        }

        log.append("URL: \(url)")
        log.append("Headers: \(headers)")
        log.append("Method: \(method)")
        log.append("Status code: \(response.statusCode)")

        if let data = stringifier.string(with: response.data) {
            log.append("Data: \(data)")
        }

        return log
    }

    private func logHTTPError(
        _ error: Error,
        forTarget target: TargetType
    ) -> [String] {
        var log = [String]()
        log.append("Error for \(target)")
        log.append("Message: \(error)")

        return log
    }

}
