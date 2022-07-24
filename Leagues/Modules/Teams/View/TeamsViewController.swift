//
//  TeamsViewController.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import UIKit

class TeamsViewController: UIViewController {
    
    // MARK: - Private UI properites
    
    private lazy var teamsView: TeamsView = {
        let view = TeamsView()
        //view.setTableViewDelegates(adapter, adapter)
        return view
    }()
    
    // MARK: - Internal properites
    
    var league: League? {
        didSet {
            //updateTableView()
        }
    }

    // MARK: - Lifecycle ViewController Methods
    
    override func loadView() {
        super.loadView()
        view = teamsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Teams"
    }
    

}
