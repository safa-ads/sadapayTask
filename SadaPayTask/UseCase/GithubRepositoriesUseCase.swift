//
//  GithubRepositoriesUseCase.swift
//  SadaPayTaskTests
//
//  Created by Safa Ads on 16/06/2023.
//

protocol GithubRepositoriesUseCaseProtocol {
    func getRepositories(completion: @escaping (Result<GitHubRepository, Error>) -> Void)
}
public class GithubRepositoriesUseCase: GithubRepositoriesUseCaseProtocol {
    public let repo: GithubRepositoriesRepoProtocol
    
    public init(repo: GithubRepositoriesRepoProtocol = GithubRepositoriesRepo()) {
        self.repo = repo
    }
    
    func getRepositories(completion: @escaping (Result<GitHubRepository, Error>) -> Void) {
        repo.getRepositories { response in
            completion(response)
        }
    }
}
