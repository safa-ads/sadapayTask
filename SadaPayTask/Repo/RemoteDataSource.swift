//
//  RemoteDataSource.swift
//  SadaPayTask
//
//  Created by Safa Ads on 15/06/2023.
//

import Foundation

public typealias RemoteDataSourceProtocol = DataSourceProtocol

public class RemoteDataSource: RemoteDataSourceProtocol {
    private let remoteService: RestServiceProtocol
    
    public init(remoteService: RestServiceProtocol = RestService()) {
        self.remoteService = remoteService
    }
    
    public func getData<T:Codable>(endpoint: EndpointProtocol, completion: @escaping (Result<T, Error>) -> Void)  {
        remoteService.request(endpoint: endpoint, completion: completion)
    }
}
