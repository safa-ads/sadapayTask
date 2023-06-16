//
//  GithubRepository+Stub.swift
//  SadaPayTaskTests
//
//  Created by Safa Ads on 16/06/2023.
//

@testable import SadaPayTask

extension GitHubRepository {
    static func stub() -> Self {
        .init(items: [.stub()])
    }
}

extension GitHubRepository.Items {
    static func stub() -> Self {
        .init(language: "Python",
              stargazersCount: 5000,
              name: "Test name",
              description: "Test Description",
              owner: .stub())
    }
}

extension GitHubRepository.Items.Owner {
    static func stub() -> Self {
        .init(avatarUrl: "https://photo.png",
              login: "Test owner name")
    }
}

