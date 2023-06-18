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
        states.onNext(.loading)
        useCase.getRepositories { [weak self] response in
            switch response {
            case .success(let value):
                self?.states.on(.next(.loaded(data: value)))
            case .failure:
                self?.states.on(.next(.error))
            }
        }
    }
}


