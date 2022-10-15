//
//  KeywordTableCell.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//

import UIKit

class KeywordTableCell: UITableViewCell {
    
    var didTapClear: (() -> Void)?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton.init(type: .system)
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
 
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        views.forEach({
            contentView.addSubview($0)
        })
        
        NSLayoutConstraint.activate(viewConstraints)
        
        clearButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    func confige(keyword: String) {
        titleLabel.text = keyword
    }
    
    @objc private func didTapButton() {
        didTapClear?()
    }
}

// MARK: - Layout & Constraints
private extension KeywordTableCell {
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
