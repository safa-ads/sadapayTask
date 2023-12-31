//
//  GithubRepositoriesViewControllerUnitTests.swift
//  SadaPayTaskTests
//
//  Created by Safa Ads on 18/06/2023.
//

import XCTest
@testable import SadaPayTask
import RxSwift


final class GithubRepositoriesViewControllerUnitTests: XCTestCase {
    private var sut: GithubRepositoriesViewController!
    private let disposeBag = DisposeBag()
    private var viewModel: GithubRepositoriesViewModelSpy!
    
    
    //MARK: - Life Sycle
    override func setUp() {
        super.setUp()
        viewModel = GithubRepositoriesViewModelSpy()
        let storyboard = UIStoryboard(name: "GithubRepositoriesViewController", bundle:  nil)
        sut = storyboard.instantiateViewController(withIdentifier: "GithubRepositoriesViewController") as? GithubRepositoriesViewController
        sut.viewModel = viewModel
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testViewDidLoad_Calls_getRepository() {
        //Then
        XCTAssertEqual(viewModel.getRepositoriesCallCount, 1)
    }
    
    func testTableView_ShouldBeShown_LoadingState() {
        //When
        viewModel.states.on(.next(.loading))
        
        //Then
        XCTAssertFalse(sut.tableView.isHidden)
    }
    
    func testTableView_ShouldBeHidden_ErrorState() {
        //When
        viewModel.states.on(.next(.error))
        
        //Then
        XCTAssertTrue(sut.tableView.isHidden)
    }
    
    func testTableView_ShouldBeShown_LoadedState() {
        //When
        viewModel.states.on(.next(.loaded(data: .stub())))
        
        //Then
        XCTAssertFalse(sut.tableView.isHidden)
    }
    
    func testErrorView_ShouldBeHidden_LoadingState() {
        //When
        viewModel.states.on(.next(.loading))
        
        //Then
        XCTAssertNil(sut.errorView)
    }
    
    func testTableView_ShouldBeShown_ErrorState() {
        //When
        viewModel.states.on(.next(.error))
        
        //Then
        XCTAssertNotNil(sut.errorView)
    }
    
    func testErrorView_ShouldBeHidden_LoadedState() {
        //When
        viewModel.states.on(.next(.loaded(data: .stub())))
        
        //Then
        XCTAssertNil(sut.errorView)
    }
}

class GithubRepositoriesViewModelSpy: GithubRepositoriesViewModelProtocol {
    var getRepositoriesCallCount = 0
    
    func getRepositories() {
        getRepositoriesCallCount += 1
    }
    
    var states: BehaviorSubject<GithubRepositoriesScene.State> = BehaviorSubject(value: .loading)
}

