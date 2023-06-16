//
//  DataSourceProtocol.swift
//  SadaPayTask
//
//  Created by Safa Ads on 15/06/2023.
//

import Foundation

public protocol DataSourceProtocol {
    func getData<T: Codable>(endpoint: EndpointProtocol, completion:  @escaping (Result<T, Error>) -> Void)
}
