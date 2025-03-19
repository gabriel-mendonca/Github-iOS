//
//  URLParamaterEncoder.swift
//  Github-iOS
//
//  Created by Gabriel on 16/03/25.
//

import Foundation

public struct URLParamaterEncoder: ParameterURLEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters)
    throws {
        guard let url = urlRequest.url else { throw NetworkEncoderError.missingURL}
        if var urlComponents = URLComponents (url: url, resolvingAgainstBaseURL: false),
           !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
    }
}
