//
//  ReposytoryTableViewController.swift
//  Github-iOS
//
//  Created by Gabriel on 14/03/25.
//

import UIKit

final class ReposytoryTableViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(RepositoryCell.self, forCellReuseIdentifier: "repository")
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    private lazy var loadingFooterView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .black
        return activityIndicator
    }()
    
    private var viewModel: RepositoryViewModelProtocol
    
    init(viewModel: RepositoryViewModelProtocol) {
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
        title = "Repository"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchRepository()
    }
    
    override func loadView() {
        super.loadView()
        view = tableView
    }
    
    private func configFooterView(_ tableView: UITableView) {
        let footerView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: tableView.bounds.width,
            height: 70
        ))
        
        footerView.addSubview(loadingFooterView)
        loadingFooterView.center = footerView.center
        tableView.tableFooterView = footerView
    }

}

extension ReposytoryTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let totalItems = viewModel.model?.count ?? 0
        if indexPath.row > totalItems - 2 {
            configFooterView(tableView)
            viewModel.loadMoreRepository()
            
        }
    }
}

extension ReposytoryTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "repository", for: indexPath) as? RepositoryCell else { return UITableViewCell() }
        let model = viewModel.model?[safe: indexPath.row]
        cell.setupCell(model: model)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension ReposytoryTableViewController: RepositoryViewModelDelegate {
    func didStartingLoading() {
        DispatchQueue.main.async {
            self.loadingFooterView.startAnimating()
        }
    }
    
    func didStopLoading() {
        DispatchQueue.main.async {
            self.loadingFooterView.stopAnimating()
        }
    }
    
    func didError(error: String) {
        print("get repository: \(error)")
    }
    
    func didSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

