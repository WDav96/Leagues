//
//  HomeView.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - Private UI Properties
    
    private var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.backgroundColor = .blueMainColor
        return stackView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Leagues"
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(LeagueTableViewCell.self, forCellReuseIdentifier: LeagueTableViewCell.name)
        return tableView
    }()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal Methods
    
    func setTableViewDelegates(_ delegate: UITableViewDelegate, _ datasource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = datasource
    }

    func reloadTableViewData() {
        tableView.reloadData()
    }
    
    // MARK: - Private Methods
    
    private func addSubViews() {
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.addArrangedSubview(tableView)
        
        addConstraints()
    }
    
    private func addConstraints() {
        // containerStackView
        containerStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        containerStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        // titleLabel
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 35).isActive = true
        // searchProductTextField
        
    }

}
