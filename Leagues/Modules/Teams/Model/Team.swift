//
//  Team.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import Foundation

struct Team: Codable {
    let name: String?
    let stadium: String?
    let yearFoundation: String?
    let logo: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "strTeam"
        case stadium = "strStadium"
        case yearFoundation = "intFormedYear"
        case logo = "strTeamLogo"
    }
    
}
