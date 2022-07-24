//
//  HomeViewController.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Private UI properites
    
    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.setTableViewDelegates(adapter, adapter)
        return view
    }()
    
    // MARK: - Internal Observable Properties
    
    var outputEvents: Observable<HomeViewModelOutput> {
        mutableOutputEvents
    }
    
    // MARK: - Private Observable Properties
    
    private let mutableOutputEvents = MutableObservable<HomeViewModelOutput>()
    
    // MARK: - Private Properties
    
    private var adapter = HomeAdapter()
    private var viewModel: HomeViewModel
    
    // MARK: - Initializers
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle ViewController Methods
    
    override func loadView() {
        super.loadView()
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getLeagues()
        setupBindings()
        
    }
    
    // MARK: - Private Methods
    
    private func setupBindings() {
        viewModel.outputEvents.observe { [weak self] event in
            self?.validateEvents(event: event)
        }
        adapter.didSelectItemAt.observe { [unowned self] league in
            self.goToTeams(league: league)
        }
    }

    private func validateEvents(event: HomeViewModelOutput) {
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
        adapter.leagues = viewModel.leagues
        homeView.reloadTableViewData()
    }

    private func goToTeams(league: League) {
        viewModel.goToTeams(league: league)
    }
    
}

