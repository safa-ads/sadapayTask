//
//  GithubRepositoriesViewModelUnitTests.swift
//  SadaPayTaskTests
//
//  Created by Safa Ads on 18/06/2023.
//

import XCTest
@testable import SadaPayTask
import RxSwift


final class GithubRepositoriesViewModelUnitTests: XCTestCase {
    private var useCase: GithubRepositoriesUseCaseSpy!
    private var sut: GithubRepositoriesViewModel!
    private let disposeBag = DisposeBag()


    //MARK: - Life Sycle
    override func setUp() {
        super.setUp()
        useCase = GithubRepositoriesUseCaseSpy()
        sut = GithubRepositoriesViewModel(useCase: useCase)
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        useCase = nil
    }

    
    func testGetRepositories_OnSuccess() {
        //Given
        let mockedResponse: GitHubRepository = .stub()
        var state: GithubRepositoriesScene.State?
        
        sut.states.subscribe { item in
            state = item.element
        }.disposed(by: disposeBag)
        
        //Current initial value should be loading
        XCTAssertEqual(state, .loading)
        //When
        sut.getRepositories()
        
        //Then
        XCTAssertEqual(state, .loaded(data: mockedResponse))
    }
    
    func testGetRepositories_OnFailure() {
        //Given
        var state: GithubRepositoriesScene.State?
        useCase.shouldSucceed = false
        
        sut.states.subscribe { item in
            state = item.element
        }.disposed(by: disposeBag)
        
        //Current initial value should be loading
        XCTAssertEqual(state, .loading)
        
        //When
        sut.getRepositories()
        
        //Then
        XCTAssertEqual(state, .error)
    }
}

class GithubRepositoriesUseCaseSpy: GithubRepositoriesUseCaseProtocol {
    var shouldSucceed = true
    func getRepositories(completion: @escaping (Result<GitHubRepository, Error>) -> Void) {
        if shouldSucceed {
            completion(.success(.stub()))
        } else {
            completion(.failure(TestingErrors.testingError))
        }
    }
}
