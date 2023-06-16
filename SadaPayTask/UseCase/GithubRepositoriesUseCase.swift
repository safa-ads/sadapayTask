//
//  GithubRepositoriesUseCase.swift
//  SadaPayTaskTests
//
//  Created by Safa Ads on 16/06/2023.
//

protocol GithubRepositoriesUseCaseProtocol {
}
public class GithubRepositoriesUseCase: GithubRepositoriesUseCaseProtocol {
    
    public let repo: GithubRepositoriesRepoProtocol
    
    public init(repo: GithubRepositoriesRepoProtocol = GithubRepositoriesRepo()) {
        self.repo = repo
    }
}
