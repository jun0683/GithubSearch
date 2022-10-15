//
//  GitHubRepositoriesInteractor.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GitHubRepositoriesBusinessLogic {
    func searchRepositories(request: GitHubRepositories.SearchRepositories.Request)
}

protocol GitHubRepositoriesDataStore {
    var keyword: String { get set }
}

class GitHubRepositoriesInteractor: GitHubRepositoriesBusinessLogic, GitHubRepositoriesDataStore {
    var presenter: GitHubRepositoriesPresentationLogic?
    var worker: GitHubRepositoriesWorker? = GitHubRepositoriesWorker()
    var keyword: String = ""
    
    // MARK: Do something
    
    func searchRepositories(request: GitHubRepositories.SearchRepositories.Request) {
        worker?.searchRepositories(keyword: keyword, completion: { result in
            switch result{
            case .success(let model):
                self.presenter?.presentSearchRepositories(response: .init(itemsRepositories: model.items))
            case .failure(let error):
                self.presenter?.presentError(response: .init(error: error))
            }
        })
    }
}
