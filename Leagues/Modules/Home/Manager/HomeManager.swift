//
//  HomeManager.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import Foundation

protocol HomeManagerProtocol {
    func getLeagues(completionHandler: @escaping ((Result<LeagueResponse, Error>) -> Void))
}

class HomeManager: HomeManagerProtocol {
    
    func getLeagues(completionHandler: @escaping ((Result<LeagueResponse, Error>) -> Void)) {
        
        guard let url = URL(string: "https://www.thesportsdb.com/api/v1/json/2/all_leagues.php") else { return }
        URLSession.shared.request(url: url, expecting: LeagueResponse.self) { result in
            switch result {
            case .success(let leagues):
                DispatchQueue.main.async {
                    completionHandler(.success(leagues))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
