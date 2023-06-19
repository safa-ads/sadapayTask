//
//  GithubRepositoriesUseCase.swift
//  SadaPayTaskTests
//
//  Created by Safa Ads on 16/06/2023.
//

import Foundation

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
            switch response {
            case .success(var value):
                value.items.indices.forEach { value.items[$0].languageColor = self.getLanguageColorCode(language: value.items[$0].language ?? "") }
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func getLanguageColorCode(language: String) -> String? {
        let colorCodes = JsonFileReader.readLocalJSONFile(fileName: "GithubColorCodes") as! [String : String]
        return colorCodes[language]
    }
}

