//
//  GitHubRepositoriesViewController.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//


import UIKit

final class GitHubRepositoriesViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        
        title = "asdf"
        
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        view.backgroundColor = .white
    }
}

