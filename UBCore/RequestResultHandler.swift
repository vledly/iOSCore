//
//  RequestResultHandler.swift
//  Core
//
//  Created by Леван Чикваидзе on 06/09/2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//


public protocol RequestResultHandler {
    associatedtype ResultType: Decodable
    
    func handleDomainErrors(
        errors: [ServerError],
        completion:  (Result<ResultType, Error>) -> Void
    )
}


extension RequestResultHandler {
    
    public func handleRequestResultClosure(
        _ result: Result<NetworkResponse<ResultType>, Error>,
        completion: (Result<ResultType, Error>) -> Void
    ) {
        switch result {
        case let .success(response):
            switch (response.result, response.errors) {
            case (let .some(resultModel), .none):
                completion(.success(resultModel))
            case (_, let .some(errors)):
                handleDomainErrors(errors: errors, completion: completion)
            default: break
                
            }
        case let .failure(error):
            completion(.failure(error))
        }
    }
    
}
