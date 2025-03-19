//
//  PullRequestDelegateSpy.swift
//  Github-iOSTests
//
//  Created by Gabriel on 19/03/25.
//


@testable import Github_iOS

final class PullRequestDelegateSpy: PullRequestsViewModelDelegate {
    var didStartLoadingCalled = false
    var didStopLoadingCalled = false
    var didSuccessCalled = false
    var didErrorCalled = false
    
    func didStartingLoading() {
        didStartLoadingCalled = true
    }
    
    func didStopLoading() {
        didStopLoadingCalled = true
    }
    
    func didSuccess() {
        didSuccessCalled = true
    }
    
    func didError(error: String) {
        didErrorCalled = true
    }
}
