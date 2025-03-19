//
//  RepositoryViewModelTests.swift
//  Github-iOSTests
//
//  Created by Gabriel on 19/03/25.
//

import XCTest
@testable import Github_iOS

final class RepositoryViewModelTests: XCTestCase {
    
    var viewModel: RepositoryViewModel!
    var stubService: StubNetworkService!
    var spyDelegate: RepositoryDelegateSpy!
    var expectedItems: [Repository]!
    
    override func setUp() {
        super.setUp()
        stubService = StubNetworkService()
        viewModel = RepositoryViewModel(manager: stubService)
        spyDelegate = RepositoryDelegateSpy()
        viewModel.delegate = spyDelegate
        expectedItems = RepositorySearchResponse.items()
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
        stubService = nil
        spyDelegate = nil
        expectedItems = nil
    }
    
    func testFetchRepositorySuccess() {
        stubService.shouldReturnError = false
     
        viewModel.fetchRepository()
        
        XCTAssertTrue(spyDelegate.didSuccessCalled)
        XCTAssertEqual(expectedItems.count, 1)
    }
    
    func testFetchRepositoryFailure() {
        stubService.shouldReturnError = true
        
        viewModel.fetchRepository()
        
        XCTAssertTrue(spyDelegate.didErrorCalled)
    }
    
    func testFetchReposytoryStartingLoading() {
        stubService.shouldReturnError = false
     
        viewModel.fetchRepository()
        
        XCTAssertTrue(spyDelegate.didStartLoadingCalled)
    }
    
    func testFetchReposytoryStopLoading() {
        stubService.shouldReturnError = false
     
        viewModel.fetchRepository()
        
        XCTAssertTrue(spyDelegate.didStopLoadingCalled)
    }
    
    func testLoadMoreRepository() {
        viewModel.hasEndPage = false
        
        viewModel.loadMoreRepository()
        
        XCTAssertEqual(viewModel.pages, 2)
    }
    
    func testLoadMoreRepositoryWhenHasEndPage() {
        viewModel.hasEndPage = true
        
        viewModel.loadMoreRepository()
        
        XCTAssertEqual(viewModel.pages, 1)
    }
}
