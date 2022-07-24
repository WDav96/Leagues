//
//  TeamsFactory.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import UIKit

enum TeamsFactory {
    
    static func getTeamsViewController(league: League) -> TeamsViewController {
        // viewController
        let viewController = TeamsViewController()
        
        //viewController.league = league
        
        return viewController
    }
    
    static func showTeamsViewController(from originViewController: UIViewController, league: League) {
        let viewController = getTeamsViewController(league: league)
        originViewController.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
