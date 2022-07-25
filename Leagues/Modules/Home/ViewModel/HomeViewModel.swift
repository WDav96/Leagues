//
//  HomeViewModel.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import Foundation

enum HomeViewModelOutput {
    case isLoading(Bool)
    case didGetData
    case errorMessage(String)
}

class HomeViewModel {
    
    // MARK: - Internal Properties
    
    var leagues: [League] = []
    
    var manager: HomeManager
    var router: HomeRouter
    
    // MARK: - Internal Observable Properties
    
    var outputEvents: Observable<HomeViewModelOutput> {
        mutableOutputEvents
    }
    
    // MARK: - Private Observable Properties
    
    private let mutableOutputEvents = MutableObservable<HomeViewModelOutput>()
    
    // MARK: - Initializers
    
    init(manager: HomeManager, router: HomeRouter) {
        self.manager = manager
        self.router = router
    }
    
    // MARK: - Internal Methods
    
     func getLeagues() {
        mutableOutputEvents.postValue(.isLoading(true))
        manager.getLeagues { [weak self] result in
            self?.mutableOutputEvents.postValue(.isLoading(false))
            switch result {
            case .success(let leaguesResponse):
                self?.leagues = leaguesResponse.leagues ?? []
                self?.mutableOutputEvents.postValue(.didGetData)
            case .failure(let error):
                self?.mutableOutputEvents.postValue(.errorMessage(error.localizedDescription))
            }
        }
        mutableOutputEvents.postValue(.isLoading(false))
    }
    
    func goToTeams(leagueName: String) {
        router.handle(transition: .showTeams(leagueName: leagueName))
    }
    
}
