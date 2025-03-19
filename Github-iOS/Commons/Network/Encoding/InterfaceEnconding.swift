//
//  InterfaceEnconding.swift
//  Github-iOS
//
//  Created by Gabriel on 16/03/25.
//

import Foundation

public typealias Parameters = [String: Any]

public protocol ParameterURLEncoder {
static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public protocol ParameterHTTPBodyEncoder {
    static func encode<T: Codable>(urlRequest: inout URLRequest, with parameters: T) throws
}

public enum NetworkEncoderError: String, Error {
case parametersNil = "Parameters were nil"
case encodingFailed = "Parameters encoding failed"
case missingURL = "URL is nil"
}
