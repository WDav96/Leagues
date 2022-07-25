//
//  TeamsViewModel.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import Foundation

enum TeamsViewModelOutput {
    case isLoading(Bool)
    case didGetData
    case errorMessage(String)
}

class TeamsViewModel {
    
    // MARK: - Internal Properties
    
    var teams: [Team] = []
    
    var manager: TeamManager
    var router: TeamsRouter
    
    // MARK: - Internal Observable Properties
    
    var outputEvents: Observable<TeamsViewModelOutput> {
        mutableOutputEvents
    }
    
    // MARK: - Private Observable Properties
    
    private let mutableOutputEvents = MutableObservable<TeamsViewModelOutput>()
    
    // MARK: - Initializers
    
    init(manager: TeamManager, router: TeamsRouter) {
        self.manager = manager
        self.router = router
    }
    
    // MARK: - Internal Methods
    
    func getTeams(leagueName: String) {
        mutableOutputEvents.postValue(.isLoading(true))
        manager.fetchTeams(leagueName: leagueName) { [weak self] result in
            self?.mutableOutputEvents.postValue(.isLoading(false))
            switch result {
            case .success(let teamsResponse):
                self?.teams = teamsResponse.teams ?? []
                self?.mutableOutputEvents.postValue(.didGetData)
            case .failure(let error):
                self?.mutableOutputEvents.postValue(.errorMessage(error.localizedDescription))
            }
        }
        mutableOutputEvents.postValue(.isLoading(false))
        
    }
    
    func goToTeamDescription(team: Team) {
        router.handle(transition: .showTeamDescription(team: team))
    }

    
}
