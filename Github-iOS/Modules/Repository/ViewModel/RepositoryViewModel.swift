//
//  RepositoryViewModel.swift
//  Github-iOS
//
//  Created by Gabriel on 15/03/25.
//

import Foundation

protocol RepositoryViewModelProtocol {
    func fetchRepository()
    func loadMoreRepository()
    var delegate: RepositoryViewModelDelegate? { get set }
    var model: [Repository]? { get }
}

protocol RepositoryViewModelDelegate: AnyObject {
    func didStartingLoading()
    func didStopLoading()
    func didSuccess()
    func didError(error: String)
}

final class RepositoryViewModel: RepositoryViewModelProtocol {
    
    private let manager: RepositoryNetworkAPI
    weak var delegate: RepositoryViewModelDelegate?
    var model: [Repository]? = []
    var language = "swift"
    var sort = "stars"
    var pages = 1
    var hasEndPage: Bool = false
    
    init(manager: RepositoryNetworkAPI = RepositoryNetworkAPI()) {
        self.manager = manager
    }
    
    func fetchRepository() {
        delegate?.didStartingLoading()
        manager.getRepository(language: language, sort: sort, page: pages) { [weak self] (responses) in
            guard let self = self else { return }
            switch responses {
            case .success(let data):
                guard let model = data.items else {
                    hasEndPage = true
                    return delegate?.didStopLoading() ?? () }
                self.model?.append(contentsOf: model)
                self.delegate?.didSuccess()
            case .failure(let error):
                if let error = error {
                    self.delegate?.didError(error: error)
                }
            }
            delegate?.didStopLoading()
        }
    }
    
    func loadMoreRepository() {
        guard !hasEndPage else { return }
        self.pages += 1
        fetchRepository()
    }
}
