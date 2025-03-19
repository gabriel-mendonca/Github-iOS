//
//  StubNetworkService.swift
//  Github-iOSTests
//
//  Created by Gabriel on 19/03/25.
//

import Foundation
@testable import Github_iOS

final class StubNetworkService: RepositoryNetworkAPI {
    
    var shouldReturnError = false
    var response = RepositorySearchResponse.dummy()
    
    override func getRepository(language: String, sort: String, page: Int, completion: @escaping (Result) -> Void) {
        if shouldReturnError {
            completion(.failure(error: ""))
        } else {
            completion(.success(data: response))
        }
    }
    
    func cancel() {
        
    }
    

}
