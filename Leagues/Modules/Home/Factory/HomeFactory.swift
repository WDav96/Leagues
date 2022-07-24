//
//  HomeFactory.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import UIKit

enum HomeFactory {
    
    static func getHomeViewController() -> HomeViewController {
        // router
        let router = HomeRouter()
        // manager
        let manager = HomeManager()
        // viewModel
        let viewModel = HomeViewModel(manager: manager, router: router)
        // viewController
        let viewController = HomeViewController(viewModel: viewModel)
        
        router.viewController = viewController
        
        return viewController
    }
    
    static func showHomeViewController(from originViewController: UIViewController) {
        let viewController = getHomeViewController()
        originViewController.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
