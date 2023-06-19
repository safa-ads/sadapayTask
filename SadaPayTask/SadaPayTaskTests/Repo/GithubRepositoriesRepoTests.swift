//
//  GithubRepositoriesRepoTests.swift
//  SadaPayTaskTests
//
//  Created by Safa Ads on 16/06/2023.
//

import XCTest
@testable import SadaPayTask

final class GithubRepositoriesRepoTests: XCTestCase {
    private var sut: GithubRepositoriesRepo!

    //MARK: - Life Cycle
    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testGithubRepositoriesRepo_GetRepositories_OnSuccess() {
        // Given
        let mockedResponse = GitHubRepository.stub()
        let remoteDataSource =  RemoteDataSourceSpy<GitHubRepository>()
        sut = GithubRepositoriesRepo(repo: .init(remote: remoteDataSource))
        remoteDataSource.response = .success(mockedResponse)

        // When
        var tempResponse: GitHubRepository?
        
        sut.getRepositories { response in
            let value = try? response.get()
            tempResponse = value
        }

        // Then
        XCTAssertEqual(tempResponse?.items.first?.name, mockedResponse.items.first?.name)
        XCTAssertEqual(tempResponse?.items.first?.language, mockedResponse.items.first?.language)
        XCTAssertEqual(tempResponse?.items.first?.description, mockedResponse.items.first?.description)
    }
    
    func testGithubRepositoriesRepo_GetRepositories_OnFailure() {
        // Given
        let remoteDataSource =  RemoteDataSourceSpy<GitHubRepository>()
        sut = GithubRepositoriesRepo(repo: .init(remote: remoteDataSource))
        remoteDataSource.response = .failure(TestingErrors.testingError)

        // When
        var tempResponse: TestingErrors?
        
        sut.getRepositories { response in
            switch response {
            case .failure(let error):
                tempResponse = error as? TestingErrors
            default:
                break
            }
        }

        // Then
        XCTAssertEqual(tempResponse, TestingErrors.testingError)
    }
}

