//
//  URLSessionExtensions.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import Foundation

extension URLSession {
    
    func fetchData(at url: URL, completion: @escaping (Result<LeagueResponse, Error>) -> Void) {
        self.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let data = try JSONDecoder().decode(LeagueResponse.self, from: data)
                    completion(.success(data))
                } catch let decoderError {
                    completion(.failure(decoderError))
                }
            }
        }
        .resume()
    }
    
}
