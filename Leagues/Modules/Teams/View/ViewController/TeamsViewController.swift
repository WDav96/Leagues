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
        view.setTableViewDelegates(adapter, adapter)
        return view
    }()
    
    // MARK: - Internal Observable Properties
    
    var outputEvents: Observable<TeamsViewModelOutput> {
        mutableOutputEvents
    }
    
    // MARK: - Private Observable Properties
    
    private let mutableOutputEvents = MutableObservable<TeamsViewModelOutput>()
    
    // MARK: - Internal properites
    
    var league: League? {
        didSet {
            //updateTableView()
        }
    }
    
    // MARK: - Private Properties
    
    private var adapter = TeamsAdapter()
    private var viewModel: TeamsViewModel
    
    // MARK: - Initializers
    
    init(viewModel: TeamsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle ViewController Methods
    
    override func loadView() {
        super.loadView()
        view = teamsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Teams"
        viewModel.getTeams()
        setupBindings()
    }
    
    // MARK: - Private Methods
    
    private func setupBindings() {
        viewModel.outputEvents.observe { [weak self] event in
            self?.validateEvents(event: event)
        }
    }
    
    private func validateEvents(event: TeamsViewModelOutput) {
        switch event {
        case .isLoading(let isLoading):
            if isLoading {
                showSpinner(onView: view)
            } else {
                removeSpinner()
            }
        case .didGetData:
            updateTableView()
        case .errorMessage(let error):
            print(error)
        }
    }
    
    private func updateTableView() {
        adapter.teams = viewModel.teams
        teamsView.reloadTableViewData()
    }

}
