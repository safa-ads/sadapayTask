//
//  GitHubRepository.swift
//  SadaPayTaskTests
//
//  Created by Safa Ads on 16/06/2023.
//

public struct GitHubRepository: Codable {
    let items: [Item]
    
    public struct Item: Codable {
        let language: String?
        let stargazersCount: Int?
        let name: String
        let description: String
        let owner: Owner
        
        public struct Owner: Codable {
            let avatarUrl: String
            let login: String
        }
    }
}
