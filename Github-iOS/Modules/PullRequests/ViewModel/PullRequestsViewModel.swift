//
//  PullRequestsViewModel.swift
//  Github-iOS
//
//  Created by Gabriel on 18/03/25.
//

import Foundation

protocol PullRequestsViewModelProtocol {
    var model: [PullRequestModel]? { get }
    var repository: String { get }
    var delegate: PullRequestsViewModelDelegate? { get set }
    func fetchPullRequest()
}

protocol PullRequestsViewModelDelegate: AnyObject {
    func didStartingLoading()
    func didStopLoading()
    func didSuccess()
    func didError(error: String)
}

final class PullRequestsViewModel: PullRequestsViewModelProtocol {
    
    weak var delegate: PullRequestsViewModelDelegate?
    var model: [PullRequestModel]?
    var repository: String
    
    private var create: String
    private var manager: PullRequestNetwork
    
    init(manager: PullRequestNetwork = PullRequestNetwork(),
             create: String, repository: String) {
        self.manager = manager
        self.create = create
        self.repository = repository
    }
    
    func fetchPullRequest() {
        delegate?.didStartingLoading()
        manager.getPullRequests(create: create, repository: repository) { [weak self] (responses) in
            guard let self = self else { return }
            switch responses {
            case .success(let data):
                self.model = data
                self.delegate?.didSuccess()
            case .failure(let error):
                if let error = error {
                    self.delegate?.didError(error: error)
                }
            }
            delegate?.didStopLoading()
        }
    }
}
