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
    private let reachability: Reachability? = Reachability()
    
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
                guard let successResponse = try? data.filter(statusCodes: 200...299) else {
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
                completion(.failure(CoreNetworkError.serialization))
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
        case 400, 401, 403:
            guard let responseModel = try? data.map(ResponseType.self) else {
                    completion(.failure(CoreNetworkError.serialization))
                    return
            }
            
            completion(.success(responseModel))
        default:
            completion(.failure(CoreNetworkError.unknown))
        }
    }
    
}
