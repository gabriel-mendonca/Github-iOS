//
//  DetailsPullRequestViewController.swift
//  Github-iOS
//
//  Created by Gabriel on 19/03/25.
//

import UIKit
import WebKit


final class DetailsPullRequestViewController: UIViewController {
    
    lazy var webView: WKWebView = {
        let view = WKWebView()
        return view
    }()
    
    
    private var url: String
    
    init(url: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configWebView()
    }
    
    func configWebView() {
        guard let url = URL(string: url) else {
            print("URL invalida")
            return
        }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

extension DetailsPullRequestViewController: ViewLayoutHelper {
    func buildViewHierarchy() {
        view.addSubview(webView)
    }
    
    func setupContraints() {
        webView.anchorTo(superview: view)
    }
    
    
}
