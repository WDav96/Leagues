//
//  TeamsAdapter.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import UIKit

class TeamsAdapter: NSObject {
    
    // MARK: - Internal Properties
    
    var teams: [Team] = []
    
    // MARK: - Internal Observable Properties
    
    var didSelectItemAt: Observable<Team> {
        mutableDidSelectItemAt
    }
    
    // MARK: - Private Observable Properties
    
    private var mutableDidSelectItemAt = MutableObservable<Team>()
    
}

// MARK: - UITableViewDataSource
extension TeamsAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.name) as? TeamTableViewCell else {
            return UITableViewCell() }
        cell.team = teams[indexPath.row]
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension TeamsAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mutableDidSelectItemAt.postValue(teams[indexPath.row])
    }
    
}
