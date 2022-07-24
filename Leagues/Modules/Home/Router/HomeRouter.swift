//
//  HomeRouter.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import UIKit

enum HomeTransition {
    case showTeams(league: League)
}

class HomeRouter {
    
    // MARK: - Internal Properties
    
    var viewController: UIViewController?
    
    // MARK: - Internal Methods
    
    func handle(transition attendanceTransition: HomeTransition) {
        switch attendanceTransition {
        case let .showTeams(league):
            showTeamsViewController(league: league)
        }
        
    }
    
    // MARK: - Private Methods
    
    private func showTeamsViewController(league: League) {
        guard let viewController = viewController else {
            return
        }
        TeamsFactory.showTeamsViewController(from: viewController, league: league)

    }
    
}
