//
//  GithubRepositoriesUseCaseUnitTests.swift
//  SadaPayTaskTests
//
//  Created by Safa Ads on 16/06/2023.
//

import XCTest
@testable import SadaPayTask

final class GithubRepositoriesUseCaseUnitTests: XCTestCase {
    private var githubRepositoriesRepo: GithubRepositoriesRepoSpy!
    private var sut: GithubRepositoriesUseCase!

    
    //MARK: - Life Sycle
    override func setUp() {
        super.setUp()
        githubRepositoriesRepo = GithubRepositoriesRepoSpy()
        sut = GithubRepositoriesUseCase(repo: githubRepositoriesRepo)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        githubRepositoriesRepo = nil
    }

    func testGithubRepositoriesUsecase_getRepositories_OnSuccess() {
        //Given
        let response = GitHubRepository.stub()
        
        //When
        var tempResponse: GitHubRepository?
        sut.getRepositories { response in
            switch response {
            case let .success(data):
                tempResponse = data
            case .failure:
                break
            }
        }
        
        //Then
        XCTAssertEqual(tempResponse?.items.first?.name, response.items.first?.name)
        XCTAssertEqual(tempResponse?.items.first?.language, response.items.first?.language)
        XCTAssertEqual(tempResponse?.items.first?.description, response.items.first?.description)
    }
    
    func testGithubRepositoriesUsecase_getRepositories_OnFailure() {
        //Given
        githubRepositoriesRepo.shouldSucceed = false
        
        //When
        var error: TestingErrors?
        sut.getRepositories { response in
            switch response {
            case .success:
                break
            case .failure(let value):
                error = value as? TestingErrors
            }
        }
        
        //Then
        XCTAssertEqual(error, TestingErrors.testingError)
    }
}

class GithubRepositoriesRepoSpy: GithubRepositoriesRepoProtocol {
    var shouldSucceed = true
    func getRepositories(completion: @escaping (Result<SadaPayTask.GitHubRepository, Error>) -> Void) {
        if shouldSucceed {
            completion(.success(.stub()))
        } else {
            completion(.failure(TestingErrors.testingError))
        }
    }
}

