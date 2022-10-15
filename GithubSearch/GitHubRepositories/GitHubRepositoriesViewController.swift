//
//  GitHubRepositoriesViewController.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GitHubRepositoriesDisplayLogic: AnyObject {
    func displaySomething(viewModel: GitHubRepositories.Something.ViewModel)
}


class GitHubRepositoriesViewController: UITableViewController, GitHubRepositoriesDisplayLogic {
    var interactor: GitHubRepositoriesBusinessLogic?
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
        
        doSomething()
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
    
    func doSomething() {
        let request = GitHubRepositories.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: GitHubRepositories.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

extension GitHubRepositoriesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoriesCell", for: indexPath) as! RepositoriesCell
        
        
        return cell
    }
    
}
