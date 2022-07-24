//
//  LeagueTableViewCell.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    static let name = String(describing: LeagueTableViewCell.self)
    
    // MARK: - Private UI Properties
    
    private var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    }()
    
    private var nameLeagueLabel: UILabel = {
        let label = UILabel()
        label.text = "Name league label"
        label.textColor = .blueMainColor
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private var sportLabel: UILabel = {
        let label = UILabel()
        label.text = "Sport label"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Internal Properties
    
    var league: League? {
        didSet {
            setupCell()
        }
    }
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func addSubViews() {
        contentView.addSubview(containerStackView)
        containerStackView.addArrangedSubview(nameLeagueLabel)
        containerStackView.addArrangedSubview(sportLabel)
        
        addConstraints()
    }
    
    private func addConstraints() {
        // containerStackView
        containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        containerStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        containerStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    private func setupCell() {
        nameLeagueLabel.text = league?.name
        sportLabel.text = league?.sport
    }

}
