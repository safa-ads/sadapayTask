//
//  GitHubRepository.swift
//  SadaPayTaskTests
//
//  Created by Safa Ads on 16/06/2023.
//

struct GitHubRepository: Codable {
    let items: [Items]
    
    struct Items: Codable {
        let language: String?
        let stargazersCount: Int?
        let name: String
        let description: String
        let owner: Owner
        
        struct Owner: Codable {
            let avatarUrl: String
            let login: String
        }
    }
}
