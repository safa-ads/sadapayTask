//
//  BaseRepo.swift
//  SadaPayTask
//
//  Created by Safa Ads on 15/06/2023.
//

import Foundation

public protocol BaseRepoProtocol {
    func getData<T: Codable>(endpoint: EndpointProtocol,
                             completion:  @escaping (Result<T, Error>) -> Void)
}

public class BaseRepo: BaseRepoProtocol {
    private let remote: RemoteDataSourceProtocol
    public init( remote: RemoteDataSourceProtocol = RemoteDataSource()) {
        self.remote = remote
    }
    
    public func getData<T: Codable>(endpoint: EndpointProtocol,
                                    completion:  @escaping (Result<T, Error>) -> Void) {
        remote.getData(endpoint: endpoint,
                       completion: completion)
    }
}
