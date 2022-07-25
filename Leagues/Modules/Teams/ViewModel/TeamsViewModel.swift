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
    
    // MARK: - Internal Observable Properties
    
    var outputEvents: Observable<TeamsViewModelOutput> {
        mutableOutputEvents
    }
    
    // MARK: - Private Observable Properties
    
    private let mutableOutputEvents = MutableObservable<TeamsViewModelOutput>()
    
    // MARK: - Initializers
    
    init(manager: TeamManager) {
        self.manager = manager
    }
    
    // MARK: - Internal Methods
    
    func getTeams() {
        mutableOutputEvents.postValue(.isLoading(true))
        manager.fetchTeams { [weak self] result in
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
    
}
