//
//  TeamDescriptionViewController.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import UIKit

class TeamDescriptionViewController: UIViewController {
    
    // MARK: - Private UI Properites
    
    private lazy var teamDescriptionView = TeamDescriptionView()
    
    // MARK: - Internal Properites
    
    var team: Team?
    
    // MARK: - Lifecycle ViewController Methods
    
    override func loadView() {
        super.loadView()
        view = teamDescriptionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        teamDescriptionView.team = team

    }

}
