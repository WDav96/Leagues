//
//  TeamDescriptionView.swift
//  Leagues
//
//  Created by David Molina on 24/07/22.
//

import UIKit

class TeamDescriptionView: UIView {

    // MARK: - Private UI Properties
    
    private var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    }()
    
    private var aliasLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blueMainColor
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private var stadiumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.blueMainColor.cgColor
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    private var nameStadiumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private var locationStadiumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private var capacityStadiumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Internal Properties
    
    var team: Team? {
        didSet {
            setupView()
        }
    }
    
    // MARK: - Private Properties
    
    private var imageService = ImageService()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func addSubViews() {
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(aliasLabel)
        containerStackView.addArrangedSubview(stadiumImageView)
        containerStackView.addArrangedSubview(nameStadiumLabel)
        containerStackView.addArrangedSubview(locationStadiumLabel)
        containerStackView.addArrangedSubview(capacityStadiumLabel)
        
        
        addConstraints()
    }
    
    private func addConstraints() {
        // containerStackView
        containerStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        containerStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        containerStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        // stadiumImageView
        stadiumImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    private func setupView() {
        aliasLabel.text = team?.alias
        nameStadiumLabel.text = team?.stadium
        locationStadiumLabel.text = team?.stadiumLocation
        capacityStadiumLabel.text = "Capacity: \(team?.stadiumCapacity ?? "")"
        let url = team?.stadiumImage ?? ""
        setupImage(url: url)
    }
    
    private func setupImage(url: String) {
        guard let url = URL(string: url) else { return }
        imageService.image(for: url) { image in
            self.stadiumImageView.image = image
        }
    }

}
