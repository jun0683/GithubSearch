//
//  GitHubRepositoriesViewController.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GitHubRepositoriesDisplayLogic: AnyObject {
    func displaySearchRepositories(viewModel: GitHubRepositories.SearchRepositories.ViewModel)
    func displayError(viewModel: GitHubRepositories.SearchRepositoriesError.ViewModel)
}


class GitHubRepositoriesViewController: UITableViewController, GitHubRepositoriesDisplayLogic {
    var interactor: GitHubRepositoriesBusinessLogic?
    var dataSource: GitHubRepositoriesDataSource?
    var router: (NSObjectProtocol & GitHubRepositoriesRoutingLogic & GitHubRepositoriesDataPassing)?
    
    // MARK: Object lifecycle
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = GitHubRepositoriesInteractor()
        let presenter = GitHubRepositoriesPresenter()
        let router = GitHubRepositoriesRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        dataSource = presenter
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        setupViews()
        
        searchRepositories()
    }
    
    private func setupNavigation() {
        navigationItem.largeTitleDisplayMode = .never
                
        title = "Repositories"
    }
    
    private func setupViews() {
        tableView.estimatedRowHeight = 100
        tableView.register(RepositoriesCell.self, forCellReuseIdentifier: "RepositoriesCell")
    }
    
    // MARK: Do something
    
    func searchRepositories() {
        let request = GitHubRepositories.SearchRepositories.Request()
        interactor?.searchRepositories(request: request)
    }
    
    func displaySearchRepositories(viewModel: GitHubRepositories.SearchRepositories.ViewModel) {
        tableView.reloadData()
    }
    
    func displayError(viewModel: GitHubRepositories.SearchRepositoriesError.ViewModel) {
        let errorAlert = UIAlertController(title: nil, message: viewModel.error.localizedDescription, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
        errorAlert.addAction(ok)
        
        present(errorAlert, animated: true, completion: nil)
    }
}

extension GitHubRepositoriesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource?.items.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoriesCell", for: indexPath) as! RepositoriesCell
        
        if let item = dataSource?.items[safe: indexPath.row] {
            cell.confige(item: item)
        }
        
        return cell
    }
    
}
