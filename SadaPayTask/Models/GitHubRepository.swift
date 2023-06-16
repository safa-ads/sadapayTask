//
//  GitHubRepository.swift
//  SadaPayTaskTests
//
//  Created by Safa Ads on 16/06/2023.
//

struct GitHubRepository {
    let items: [Items]
    
    struct Items {
        let language: String?
        let stargazersCount: Int?
        let name: String
        let description: String
        let owner: Owner
        
        struct Owner {
            let avatarUrl: String
            let login: String
        }
    }
}
