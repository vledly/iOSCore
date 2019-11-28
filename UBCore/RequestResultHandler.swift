//
//  RequestResultHandler.swift
//  Core
//
//  Created by Леван Чикваидзе on 06/09/2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//


public protocol RequestResultHandler {

    func handleDomainErrors(
        errors: [ServerError],
        completion: (Error) -> Void
    )
    
}


extension RequestResultHandler {
    
    public func handleRequestResultClosure<ResultType: Decodable>(
        _ result: Result<NetworkResponse<ResultType>, Error>,
        completion: (Result<ResultType, Error>) -> Void
    ) {
        switch result {
        case let .success(response):
            switch (response.result, response.errors) {
            case (let .some(resultModel), .none):
                completion(.success(resultModel))
            case (_, let .some(errors)):
                handleDomainErrors(errors: errors) {
                    completion(.failure($0))
                }
            default:
                completion(.failure(CoreNetworkError.unknown))
            }
        case let .failure(error):
            completion(.failure(error))
        }
    }
    
}
