//
//  SceneDelegate.swift
//  Github-iOS
//
//  Created by Gabriel on 14/03/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        let viewModel = RepositoryViewModel()
        let rootViewController = ReposytoryTableViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}

