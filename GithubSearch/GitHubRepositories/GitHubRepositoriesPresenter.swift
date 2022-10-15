//
//  GitHubRepositoriesPresenter.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GitHubRepositoriesDataSource {
    var items: [GitHubRepositories.ItemViewModel] { get }
}

protocol GitHubRepositoriesPresentationLogic {
    func presentSearchRepositories(response: GitHubRepositories.SearchRepositories.Response)
    func presentError(response: GitHubRepositories.SearchRepositoriesError.Response)
}

class GitHubRepositoriesPresenter: GitHubRepositoriesDataSource, GitHubRepositoriesPresentationLogic {
    weak var viewController: GitHubRepositoriesDisplayLogic?
    
    var items: [GitHubRepositories.ItemViewModel] = []
    
    // MARK: Do something
    
    func presentSearchRepositories(response: GitHubRepositories.SearchRepositories.Response) {
        items = response.itemsRepositories.map({
            GitHubRepositories.ItemViewModel(ownerIconUrl: $0.owner?.avatarURL,
                                             ownerName: $0.owner?.login,
                                             itemName: $0.name,
                                             itemDescription: $0.itemDescription,
                                             starCounter: $0.stargazersCount?.description ?? "0",
                                             language: $0.language)
        })
        
        viewController?.displaySearchRepositories(viewModel: .init(repositories: items))
    }
    
    func presentError(response: GitHubRepositories.SearchRepositoriesError.Response) {
        viewController?.displayError(viewModel: .init(error: response.error))
    }
}
