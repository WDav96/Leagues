//
//  League.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import Foundation

struct League: Decodable {
    let name: String?
    let sport: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "strLeague"
        case sport = "strSport"
    }
    
}
