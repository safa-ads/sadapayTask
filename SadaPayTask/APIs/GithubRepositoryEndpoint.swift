//
//  GithubRepositoryEndpoint.swift
//  SadaPayTaskTests
//
//  Created by Safa Ads on 16/06/2023.
//

public enum GithubRepositoryEndpoints {
    case getRepositories
}

extension GithubRepositoryEndpoints: EndpointProtocol {
    public var url: String {
        switch self {
        case .getRepositories:
            return "https://api.github.com/search/repositories?q=language+sort:stars"
        }
    }
}
