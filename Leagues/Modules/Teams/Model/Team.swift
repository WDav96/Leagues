//
//  Team.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import Foundation

struct Team: Codable {
    let name: String?
    let yearFoundation: String?
    let logo: String?
    let stadium: String?
    let stadiumImage: String?
    let stadiumLocation: String?
    let stadiumCapacity: String?
    let alias: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "strTeam"
        case stadium = "strStadium"
        case yearFoundation = "intFormedYear"
        case logo = "strTeamLogo"
        case stadiumImage = "strStadiumThumb"
        case stadiumLocation = "strStadiumLocation"
        case stadiumCapacity = "intStadiumCapacity"
        case alias = "strKeywords"
    }
    
}
