//
//  TeamsRouter.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import UIKit

enum TeamsTransition {
    case showTeamDescription(team: Team)
}

class TeamsRouter {
    
    // MARK: - Internal Properties
    
    var viewController: UIViewController?
    
    // MARK: - Internal Methods
    
    func handle(transition attendanceTransition: TeamsTransition) {
        switch attendanceTransition {
        case let .showTeamDescription(team):
            showTeamsDescriptionViewController(team: team)
        }
        
    }
    
    // MARK: - Private Methods
    
    private func showTeamsDescriptionViewController(team: Team) {
        guard let viewController = viewController else {
            return
        }
        TeamDescriptionFactory.showTeamDescriptionViewController(from: viewController, team: team)

    }
    
}
