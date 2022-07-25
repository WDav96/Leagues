//
//  TeamManager.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import Foundation

class TeamManager {
    
    func fetchTeams(completionHandler: @escaping ((Result<TeamResponse, Error>) -> Void)){
        
        guard let url = URL(string: "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League") else { return }
        
        URLSession.shared.request(url: url, expecting: TeamResponse.self) { result in
            switch result {
            case .success(let teams):
                DispatchQueue.main.async {
                    completionHandler(.success(teams))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
