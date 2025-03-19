//
//  PullRequestNetwork.swift
//  Github-iOS
//
//  Created by Gabriel on 19/03/25.
//

import Foundation

enum Results {
    case success(data: [PullRequestModel])
    case failure(error: String?)
}

enum APIHomeEndPoint {
    case repository(create: String, repository: String)
}

extension APIHomeEndPoint: EndPointType {
   
    var baseURL: URL {
        return URL(string: BaseURL().baseURL)!
    }
    
    var path: String {
        switch self {
        case .repository(let create, let repository):
            return "/repos/\(create)/\(repository)/pulls"
        }
    }
    
    var task: HTTPTask<Int>? {
        return nil
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}

final class PullRequestNetwork: NetworkManager {
    
    internal let router = Router<APIHomeEndPoint>()
    
    func getPullRequests(create: String, repository: String, completion: @escaping (_ results: Results) -> Void) {
        router.request(.repository(create: create, repository: repository)) { (data, _, error) in
            if error != nil {
                completion(.failure(error: "Please check your network connection"))
            }
            
            if let data = data {
                do {
                    let pullRequest = try JSONDecoder().decode([PullRequestModel].self, from: data)
                    completion(.success(data: pullRequest))
                } catch {
                    completion(.failure(error: NetworkResponse.unableToDecode.rawValue))
                }
                
            }
        }
    }
}
