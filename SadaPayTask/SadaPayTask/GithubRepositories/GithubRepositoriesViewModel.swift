//
//  GithubRepositoriesViewModel.swift
//  SadaPayTask
//
//  Created by Safa Ads on 16/06/2023.
//

import RxSwift

protocol GithubRepositoriesViewModelProtocol {
    func getRepositories()
    var states: BehaviorSubject<GithubRepositoriesScene.State> { get }
}

class GithubRepositoriesViewModel: GithubRepositoriesViewModelProtocol {
    var useCase: GithubRepositoriesUseCaseProtocol
    let states: BehaviorSubject<GithubRepositoriesScene.State> = BehaviorSubject(value: .loading)
    public init(useCase: GithubRepositoriesUseCaseProtocol = GithubRepositoriesUseCase()) {
        self.useCase = useCase
    }
    
    func getRepositories() {
    }
}


