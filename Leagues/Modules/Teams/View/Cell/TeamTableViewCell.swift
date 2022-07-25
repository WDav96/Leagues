//
//  TeamTableViewCell.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    static let name = String(describing: TeamTableViewCell.self)

    // MARK: - Private UI Properties
    
    private var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.blueMainColor.cgColor
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .blueMainColor
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private var stadiumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private var yearFoundation: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    // MARK: - Internal Properties
    
    var team: Team? {
        didSet {
            setupCell()
        }
    }
    
    // MARK: - Private Properties
    
    private var imageService = ImageService()
    
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
        contentView.addSubview(logoImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(stadiumLabel)
        contentView.addSubview(yearFoundation)

        addConstraints()
    }
    
    private func addConstraints() {
        // logoImageView
        logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        logoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        logoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        // nameLabel
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: logoImageView.rightAnchor, constant: 15).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        // stadiumLabel
        stadiumLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15).isActive = true
        stadiumLabel.leftAnchor.constraint(equalTo: logoImageView.rightAnchor, constant: 15).isActive = true
        stadiumLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        // yearFoundation
        yearFoundation.topAnchor.constraint(equalTo: stadiumLabel.bottomAnchor, constant: 15).isActive = true
        yearFoundation.leftAnchor.constraint(equalTo: logoImageView.rightAnchor, constant: 15).isActive = true
        yearFoundation.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
    }
    
    private func setupCell() {
        nameLabel.text = team?.name
        stadiumLabel.text = team?.stadium
        yearFoundation.text = team?.yearFoundation
        let url = team?.logo ?? ""
        setupImage(url: url)
    }
    
    private func setupImage(url: String) {
        guard let url = URL(string: url) else { return }
        imageService.image(for: url) { image in
            self.logoImageView.image = image
        }
    }

}
