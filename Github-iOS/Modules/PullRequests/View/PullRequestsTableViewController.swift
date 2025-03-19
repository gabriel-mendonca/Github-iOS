//
//  PullRequestsTableViewController.swift
//  Github-iOS
//
//  Created by Gabriel on 18/03/25.
//

import UIKit

final class PullRequestsTableViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(PullRequestCell.self, forCellReuseIdentifier: "pullRequest")
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    private lazy var emptyView: EmptyView = {
        let view = EmptyView()
        return view
    }()
    
    private lazy var loadingView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .black
        return activityIndicator
    }()
    
    private var viewModel: PullRequestsViewModelProtocol
    
    init(viewModel: PullRequestsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Pull Requests"
        bind()
        configLoadingView()
        configNavigationController()
        viewModel.fetchPullRequest()
    }
    
    override func loadView() {
        super.loadView()
        view = tableView
    }
    
    private func configLoadingView() {
        view.addSubview(loadingView)
        loadingView.anchorCenterSuperview()
    }
    
    private func configNavigationController() {
        if let navigation = navigationController {
            let buttonItem = UIBarButtonItem()
            buttonItem.title = viewModel.repository
            navigation.navigationBar.topItem?.backBarButtonItem = buttonItem
        }
    }
    
    private func bind() {
        emptyView.action = { [weak self] in
            guard let self else { return }
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}

extension PullRequestsTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let isEmpty = viewModel.model?.isEmpty
        if isEmpty ?? false {
            return emptyView
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let isEmpty = viewModel.model?.isEmpty
        if isEmpty ?? false {
            return tableView.bounds.height
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension PullRequestsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pullRequest", for: indexPath) as? PullRequestCell else { return UITableViewCell() }
        
        let model = viewModel.model?[indexPath.row]
        cell.setupCell(model: model)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = viewModel.model?[safe: indexPath.row]?.htmlUrl else { return }
        let viewController = DetailsPullRequestViewController(url: url)
        present(viewController, animated: true)
    }
}

extension PullRequestsTableViewController: PullRequestsViewModelDelegate {
    func didStartingLoading() {
        DispatchQueue.main.async {
            self.loadingView.startAnimating()
        }
    }
    
    func didStopLoading() {
        DispatchQueue.main.async {
            self.loadingView.stopAnimating()
        }
    }
    
    func didSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didError(error: String) {
        print("get pull requests: \(error)")
    }
    
    
}
