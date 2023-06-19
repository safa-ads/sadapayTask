//
//  GitHubRepository.swift
//  SadaPayTaskTests
//
//  Created by Safa Ads on 16/06/2023.
//

public struct GitHubRepository: Codable, Equatable {
    var items: [Item]
    
    public struct Item: Codable, Equatable {
        let language: String?
        let stargazersCount: Int?
        let name: String
        let description: String
        let owner: Owner
        var languageColor: String?
        
        public init(language: String? = nil,
                    stargazersCount: Int? = nil,
                    name: String,
                    description: String,
                    owner:Owner,
                    languageColor: String? = nil) {
            self.language = language
            self.stargazersCount = stargazersCount
            self.name = name
            self.description = description
            self.owner = owner
            self.languageColor = languageColor
        }
        
        enum CodingKeys: String, CodingKey {
            case language
            case stargazersCount
            case name
            case description
            case owner
            
        }
        
        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            language = try values.decodeIfPresent(String.self, forKey: .language)
            name = try values.decode(String.self, forKey: .name)
            stargazersCount = try values.decodeIfPresent(Int.self, forKey: .stargazersCount)
            description = try values.decode(String.self, forKey: .description)
            owner = try values.decode(Owner.self, forKey: .owner)
        }
        
        public struct Owner: Codable, Equatable {
            let avatarUrl: String
            let login: String
        }
    }
    
    
}
