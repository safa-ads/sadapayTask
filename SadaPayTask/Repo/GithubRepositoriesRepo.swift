//
//  GithubRepositoriesRepo.swift
//  SadaPayTask
//
//  Created by Safa Ads on 15/06/2023.
//

import Foundation

public protocol GithubRepositoriesRepoProtocol {
}

public class GithubRepositoriesRepo: GithubRepositoriesRepoProtocol {
    public var repo: BaseRepo
    public init(repo: BaseRepo = BaseRepo()) {
        self.repo = repo
    }
    
    
}

