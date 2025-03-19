//
//  PullRequestViewModelTests.swift
//  Github-iOSTests
//
//  Created by Gabriel on 19/03/25.
//

import XCTest
@testable import Github_iOS

final class PullRequestViewModelTests: XCTestCase {
    
    var sut: PullRequestsViewModel!
    var stubPullRequestService: StubPullRequestNetworkService!
    var spyPullRequestDelegate: PullRequestDelegateSpy!
    
    override func setUp() {
        super.setUp()
        stubPullRequestService = StubPullRequestNetworkService()
        sut = PullRequestsViewModel(manager: stubPullRequestService, create: "teste", repository: "teste")
        spyPullRequestDelegate = PullRequestDelegateSpy()
        sut.delegate = spyPullRequestDelegate
        
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        stubPullRequestService = nil
        spyPullRequestDelegate = nil
    }
    
    func testFetchPullRequest_Success() {
        stubPullRequestService.shoulReturnError = false
        
        sut.fetchPullRequest()
        
        XCTAssertTrue(spyPullRequestDelegate.didSuccessCalled)
    }
    
    func testFetchPullRequest_Failure() {
        stubPullRequestService.shoulReturnError = true
        
        sut.fetchPullRequest()
        
        
        XCTAssertTrue(spyPullRequestDelegate.didErrorCalled)
    }
    
    func testFetchPullRequestStartingLoading() {
        stubPullRequestService.shoulReturnError = false
        
        sut.fetchPullRequest()
        
        XCTAssertTrue(spyPullRequestDelegate.didStartLoadingCalled)
    }
    
    func testFetchPullRequestStopLoading() {
        stubPullRequestService.shoulReturnError = false
        
        sut.fetchPullRequest()
        
        XCTAssertTrue(spyPullRequestDelegate.didStopLoadingCalled)
    }
}
