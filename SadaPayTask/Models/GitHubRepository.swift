//
//  GitHubRepository.swift
//  SadaPayTaskTests
//
//  Created by Safa Ads on 16/06/2023.
//

public struct GitHubRepository: Codable, Equatable {
    let items: [Item]
    
    public struct Item: Codable, Equatable {
        let language: String?
        let stargazersCount: Int?
        let name: String
        let description: String
        let owner: Owner
        
        public struct Owner: Codable, Equatable {
            let avatarUrl: String
            let login: String
        }
    }
}
