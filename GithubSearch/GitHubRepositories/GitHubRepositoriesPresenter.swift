//
//  GitHubRepositoriesPresenter.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GitHubRepositoriesPresentationLogic {
    func presentSomething(response: GitHubRepositories.Something.Response)
}

class GitHubRepositoriesPresenter: GitHubRepositoriesPresentationLogic {
    weak var viewController: GitHubRepositoriesDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: GitHubRepositories.Something.Response) {
        let viewModel = GitHubRepositories.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
