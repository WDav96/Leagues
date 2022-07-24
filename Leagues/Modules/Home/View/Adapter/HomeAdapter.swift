//
//  HomeAdapter.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import UIKit

class HomeAdapter: NSObject {
    
    // MARK: - Internal Properties
    
    var leagues: [League] = []
    
    // MARK: - Internal Observable Properties
    
    var didSelectItemAt: Observable<League> {
        mutableDidSelectItemAt
    }
    
    // MARK: - Private Observable Properties
    
    private var mutableDidSelectItemAt = MutableObservable<League>()
    
}

// MARK: - UITableViewDataSource
extension HomeAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LeagueTableViewCell.name) as? LeagueTableViewCell else { return UITableViewCell() }
        cell.league = leagues[indexPath.row]
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension HomeAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mutableDidSelectItemAt.postValue(leagues[indexPath.row])
    }
    
}
