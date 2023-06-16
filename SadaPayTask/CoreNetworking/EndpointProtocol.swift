//
//  EndpointProtocol.swift
//  SadaPayTaskTests
//
//  Created by Safa Ads on 16/06/2023.
//

import Foundation

public protocol EndpointProtocol {
    var url: String { get }
}

public extension EndpointProtocol {
    var urlRequest: URLRequest? {
        var urlRequest = URLRequest(url: URL(string: url)!)
        return urlRequest
    }
}

