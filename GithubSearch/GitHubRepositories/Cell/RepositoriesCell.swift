//
//  RepositoriesCell.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//

import UIKit

class RepositoriesCell: UITableViewCell {
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let ownerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let ownerIcon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private let ownerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let itemNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let itemDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let etcStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let starIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "star")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private let starCounterLabel: UILabel = {
        let label = UILabel()
        label.text = "123"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let languageLabel: UILabel = {
        let label = UILabel()
        label.text = "swift"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
 
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(verticalStackView)
        
        ownerViews.forEach({
            ownerStackView.addArrangedSubview($0)
        })
        
        etcViews.forEach({
            etcStackView.addArrangedSubview($0)
        })
        
        verticalStackView.addArrangedSubview(ownerStackView)
        verticalStackView.addArrangedSubview(itemNameLabel)
        verticalStackView.addArrangedSubview(itemDescriptionLabel)
        verticalStackView.addArrangedSubview(etcStackView)
        
        NSLayoutConstraint.activate(viewConstraints)
    }
    
    func confige(keyword: String) {
        
    }
}

// MARK: - Layout & Constraints
private extension RepositoriesCell {
    var ownerViews: [UIView] {
        return [
            ownerIcon, ownerNameLabel
        ]
    }
    
    var etcViews: [UIView] {
        return [
            starIcon, starCounterLabel, languageLabel
        ]
    }
    
    var viewConstraints: [NSLayoutConstraint] {
        return [
            verticalStackViewConstraints, ownerIconConstraints
        ].flatMap { $0 }
    }
    
    var verticalStackViewConstraints: [NSLayoutConstraint] {
        [verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
         verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
         verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
         verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)]
    }
    
    var ownerIconConstraints: [NSLayoutConstraint] {
        [ownerIcon.heightAnchor.constraint(equalToConstant: 20),
         ownerIcon.widthAnchor.constraint(equalToConstant: 20)]
    }
}

