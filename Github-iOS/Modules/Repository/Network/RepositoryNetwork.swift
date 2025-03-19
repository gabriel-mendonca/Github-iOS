//
//  RepositoryNetwork.swift
//  Github-iOS
//
//  Created by Gabriel on 16/03/25.
//

import Foundation

enum Result {
    case success(data: RepositorySearchResponse)
    case failure(error: String?)
}

enum APIHomeEndPoints {
    case search(language: String, sort: String, page: Int)
}

extension APIHomeEndPoints: EndPointType {
   
    var baseURL: URL {
        return URL(string: BaseURL().baseURL)!
    }
    
    var path: String {
        switch self {
        case .search:
            return "/search/repositories"
        }
    }
    
    var task: HTTPTask<Int>? {
        switch self {
        case .search(let language, let sort, let page):
            let query = "language:\(language)"
            return .requestParameters(urlParameters: [
                "q": query,
                "sort": sort,
                "page": "\(page)"
            ])
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}

class RepositoryNetworkAPI: NetworkManager {
    
    internal let router = Router<APIHomeEndPoints>()
    
    func getRepository(language: String, sort: String, page: Int, completion: @escaping (_ results: Result) -> Void) {
        router.request(.search(language: language, sort: sort, page: page)) { (data, _, error) in
            if error != nil {
                completion(.failure(error: "Please check your network connection"))
            }
            
            if let data = data {
                do {
                    let repository = try JSONDecoder().decode(RepositorySearchResponse.self, from: data)
                    completion(.success(data: repository))
                } catch {
                    completion(.failure(error: NetworkResponse.unableToDecode.rawValue))
                }
                
            }
        }
    }
}
