//
//  RecentHeaderView.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//

import UIKit

class RecentHeaderView: UITableViewHeaderFooterView {
    
    var didTapClear: (() -> Void)?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "test"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton.init(type: .system)
        button.setTitle("Clear", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        views.forEach({
            addSubview($0)
        })
        
        NSLayoutConstraint.activate(viewConstraints)
        
        clearButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        didTapClear?()
    }
}

// MARK: - Layout & Constraints
private extension RecentHeaderView {
    var views: [UIView] {
        return [
            titleLabel, clearButton
        ]
    }
    
    var viewConstraints: [NSLayoutConstraint] {
        return [
            titleLabelConstraints, clearButtonConstraints
        ].flatMap { $0 }
    }
    
    var titleLabelConstraints: [NSLayoutConstraint] {
        [titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
         titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)]
    }
    
    var clearButtonConstraints: [NSLayoutConstraint] {
        [clearButton.centerYAnchor.constraint(equalTo: centerYAnchor),
         clearButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)]
    }
}
