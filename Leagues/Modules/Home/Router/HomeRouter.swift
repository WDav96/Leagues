//
//  HomeRouter.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import UIKit

enum HomeTransition {
    case showTeams(leagueName: String)
}

class HomeRouter {
    
    // MARK: - Internal Properties
    
    var viewController: UIViewController?
    
    // MARK: - Internal Methods
    
    func handle(transition attendanceTransition: HomeTransition) {
        switch attendanceTransition {
        case let .showTeams(leagueName):
            showTeamsViewController(leagueName: leagueName)
        }
        
    }
    
    // MARK: - Private Methods
    
    private func showTeamsViewController(leagueName: String) {
        guard let viewController = viewController else {
            return
        }
        TeamsFactory.showTeamsViewController(from: viewController, leagueName: leagueName)

    }
    
}
