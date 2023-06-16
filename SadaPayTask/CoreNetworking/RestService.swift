//
//  RestService.swift
//  SadaPayTask
//
//  Created by Safa Ads on 15/06/2023.
//

import Foundation

// MARK: - RestServiceProtocol

public protocol RestServiceProtocol {
    func request<T:Codable>(urlRequest: URLRequest,
                            completion: @escaping (Result<T, Error>) -> Void)
}

public class RestService: RestServiceProtocol {
    let urlSession: URLSession
    
    
    public init(urlSession: URLSession = URLSession.shared) {
      self.urlSession = urlSession
    }
    
    public func request<T:Codable>(urlRequest: URLRequest,
                                   completion: @escaping (Result<T, Error>) -> Void) {
        
        let task = urlSession.dataTask(with: urlRequest) { data, response, error in
            if let data {
                do {
                    try completion(.success(CustomDecoder.decoder(data: data)))
                } catch(let error) {
                    completion(.failure(error))
                }
            }
            if let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
