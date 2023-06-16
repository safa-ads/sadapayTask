//
//  GithubRepositoriesRepo.swift
//  SadaPayTask
//
//  Created by Safa Ads on 15/06/2023.
//

import Foundation

public protocol GithubRepositoriesRepoProtocol {
    func getRepositories(completion: @escaping (Result<GitHubRepository, Error>) -> Void)
}

public class GithubRepositoriesRepo: GithubRepositoriesRepoProtocol {
    public var repo: BaseRepo
    public init(repo: BaseRepo = BaseRepo()) {
        self.repo = repo
    }
    
    
    public func getRepositories(completion: @escaping (Result<GitHubRepository, Error>) -> Void) {
        let endpoint = GithubRepositoryEndpoints.getRepositories
        repo.getData(endpoint: endpoint) { response in
            completion(response)
        }
    }
}

