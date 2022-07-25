//
//  TeamDescriptionFactory.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import UIKit

enum TeamDescriptionFactory {
    
    static func getTeamDescriptionViewController(team: Team) -> TeamDescriptionViewController {
        // viewController
        let viewController = TeamDescriptionViewController()
        
        viewController.team = team
        
        return viewController
    }
    
    static func showTeamDescriptionViewController(from originViewController: UIViewController, team: Team) {
        let viewController = getTeamDescriptionViewController(team: team)
        originViewController.navigationController?.present(viewController, animated: true)
    }
    
}

