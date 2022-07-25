//
//  TeamsFactory.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import UIKit

enum TeamsFactory {
    
    static func getTeamsViewController(leagueName: String) -> TeamsViewController {
        // router
        let router = TeamsRouter()
        // manager
        let manager = TeamManager()
        // viewModel
        let viewModel = TeamsViewModel(manager: manager, router: router)
        // viewController
        let viewController = TeamsViewController(viewModel: viewModel)
        
        viewController.leagueName = leagueName
        router.viewController = viewController
        
        return viewController
    }
    
    static func showTeamsViewController(from originViewController: UIViewController, leagueName: String) {
        let viewController = getTeamsViewController(leagueName: leagueName)
        originViewController.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
