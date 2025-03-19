//
//  EndPointType.swift
//  Github-iOS
//
//  Created by Gabriel on 16/03/25.
//

import Foundation

protocol EndPointType {
    associatedtype GenericCodable: Codable
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask<GenericCodable>? { get }
    var headers: HTTPHeaders? { get }
}
