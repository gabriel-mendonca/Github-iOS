//
//  PullRequestStubNetworkService.swift
//  Github-iOSTests
//
//  Created by Gabriel on 19/03/25.
//

import Foundation
@testable import Github_iOS

final class StubPullRequestNetworkService: PullRequestNetwork {
    
    var shoulReturnError = false
    var response = PullRequestModel.dummy()
    
    override func getPullRequests(create: String, repository: String, completion: @escaping (Results) -> Void) {
        if shoulReturnError {
            completion(.failure(error: ""))
        } else {
            completion(.success(data: [response]))
        }
    }
}
