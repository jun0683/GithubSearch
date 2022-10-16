//
//  SearchOptionViewController.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/16.
//

import UIKit

protocol SearchOptionDelegate: AnyObject {
    func selectOption(_ option: GitHubRepositories.SearchOptions?)
}

final class SearchOptionViewController: UITableViewController {
    
    private var optionList: [String] = []
    weak var delegate: SearchOptionDelegate?
    var option: GitHubRepositories.SearchOptions?
    
    // MARK: Object lifecycle
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(close))
        
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        if let option = option {
            switch option {
            case .order:
                title = "order"
                optionList = option.optionList()
            case .sort:
                title = "sort"
                optionList = option.optionList()
            }
        }
    }
    
    @objc private func close() {
        dismiss(animated: true)
    }
}

extension SearchOptionViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        optionList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let option = optionList[safe: indexPath.row] {
            var content = cell.defaultContentConfiguration()
            content.text = option
            cell.contentConfiguration = content
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let optionString = optionList[safe: indexPath.row],
           let option = option {
            delegate?.selectOption(option.optionType(optionString))
        }
        dismiss(animated: true)
    }
}
