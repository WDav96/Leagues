//
//  TeamManager.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import Foundation

class TeamManager {
    
    func fetchTeams(leagueName: String, completionHandler: @escaping ((Result<TeamResponse, Error>) -> Void)){
        
        let query = leagueName.replacingOccurrences(of: " ", with: "%20")
        
        guard let url = URL(string: "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=\(query)") else { return }
        
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
