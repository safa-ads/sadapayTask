//
//  Models.swift
//  SadaPayTask
//
//  Created by Safa Ads on 18/06/2023.
//

enum GithubRepositoriesScene {
    enum State: Equatable {
        case loading
        case loaded(data: GitHubRepository)
        case error
    }
}
