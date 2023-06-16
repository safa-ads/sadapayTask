//
//  RemoteDataSourceSpy.swift
//  SadaPayTaskTests
//
//  Created by Safa Ads on 16/06/2023.
//

import Foundation
@testable import SadaPayTask

final class RemoteDataSourceSpy<T: Codable>: RemoteDataSourceProtocol {
    public var response: Result<T, Error>?
    public var counter: Int = 0
    public var urlRequest: URLRequest?

    func getData<T: Codable>(endpoint: EndpointProtocol, completion: @escaping (Result<T, Error>) -> Void) {
        self.counter += 1
        self.urlRequest = endpoint.urlRequest
        if let response  {
            switch response {
            case .success(let value):
                completion(.success(value as! T))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

enum RemoteDataSourceErrors: Error, Equatable {
  case testingError
}
