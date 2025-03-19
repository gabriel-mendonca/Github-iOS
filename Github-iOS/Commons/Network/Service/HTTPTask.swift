//
//  HTTPTask.swift
//  Github-iOS
//
//  Created by Gabriel on 16/03/25.
//

import Foundation

public typealias HTTPHeaders = [String: String]

public enum HTTPTask<T: Codable> {
    case request
    case requestParameters(urlParameters: Parameters?)
    case requestParametersAndHeaders(urlParameters: Parameters?, additionHeaders: HTTPHeaders?)
}
