//
//  GithubRepositoriesViewModel.swift
//  SadaPayTask
//
//  Created by Safa Ads on 16/06/2023.
//


protocol GithubRepositoriesViewModelProtocol {
}

class GithubRepositoriesViewModel: GithubRepositoriesViewModelProtocol {
    var useCase: GithubRepositoriesUseCaseProtocol
    
    public init(useCase: GithubRepositoriesUseCaseProtocol = GithubRepositoriesUseCase()) {
        self.useCase = useCase
    }
}


