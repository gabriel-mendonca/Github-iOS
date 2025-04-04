//
//  NetworkRouter.swift
//  Github-iOS
//
//  Created by Gabriel on 16/03/25.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?) -> Void

protocol NetworkRouter {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
