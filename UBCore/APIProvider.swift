//
//  APIProvider.swift
//  Core
//
//  Created by Леван Чикваидзе on 02/09/2019.
//  Copyright © 2019 UnitBean. All rights reserved.
//

import Moya
import Reachability

public struct APIProvider<EndPointType: TargetType> {
    
    private let provider: MoyaProvider<EndPointType>
    private let reachability: Reachability? = try? Reachability()
    
    public init(
        provider: MoyaProvider<EndPointType>
    ) {
        self.provider = provider
    }
    
    
    public func request<ResponseType: Decodable>(
        _ endPoint: EndPointType,
        completion: @escaping (Result<ResponseType, Error>) -> Void
    ) {
        provider.request(endPoint) {
            response in
            
            switch response {
            case let .success(data):
                guard let successResponse = try? data.filterSuccessfulStatusCodes() else {
                        self.handlerErrorResponse(
                            data: data,
                            repeatEndPoint: endPoint,
                            completion: completion
                        )
                        
                        return
                }
                
                self.handleSuccessResponse(
                    data: successResponse,
                    completion: completion
                )
                
            case .failure:
                
                switch self.reachability?.connection {
                case .none:
                    completion(.failure(CoreNetworkError.reachabilityLost))
                case .some:
                    completion(.failure(CoreNetworkError.unknown))
                }
                
            }
        }
    }
    
    private func handleSuccessResponse<ResponseType: Decodable>(
        data: Response,
        completion: @escaping (Result<ResponseType, Error>) -> Void
    ) {
        guard let responseModel = try? data.map(ResponseType.self) else {
            do {
                let string = try data.mapString()
                ResponseType.self == String.self
                    ? completion(.success(string as! ResponseType))
                    : completion(.failure(CoreNetworkError.serialization))
            } catch {
                completion(.failure(CoreNetworkError.serialization))
            }
            
            return
        }
        
        completion(.success(responseModel))
    }
    
    private func handlerErrorResponse<ResponseType: Decodable>(
        data: Response,
        repeatEndPoint: EndPointType,
        completion: @escaping (Result<ResponseType, Error>) -> Void
    ) {
        switch data.statusCode {
        case 401:
            completion(.failure(CoreAuthError.unauthorized))
        case 403:
            completion(.failure(CoreAuthError.forbidden))
        case 400...499:
            guard
                let responseModel = try? data.map(ResponseType.self)
            else {
                completion(.failure(CoreNetworkError.server(code: data.statusCode)))
                return
            }
            
            completion(.success(responseModel))
        default:
            completion(.failure(CoreNetworkError.unknown))
        }
    }
    
}
