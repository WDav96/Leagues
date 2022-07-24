//
//  HomeManager.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import Foundation

class HomeManager {
    
    func getLeagues(onCompletion: @escaping ((Result<LeagueResponse, Error>) -> Void)) {
        
        guard let url = URL(string: "https://www.thesportsdb.com/api/v1/json/2/all_leagues.php") else {
            return
        }
        URLSession.shared.fetchData(at: url) { result in
            switch result {
            case .success(let leagues):
                DispatchQueue.main.async {
                    onCompletion(.success(leagues))
                }
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }
    
}
