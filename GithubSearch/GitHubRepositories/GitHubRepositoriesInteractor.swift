//
//  GitHubRepositoriesInteractor.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GitHubRepositoriesBusinessLogic {
    func doSomething(request: GitHubRepositories.Something.Request)
}

protocol GitHubRepositoriesDataStore {
    var keyword: String { get set }
}

class GitHubRepositoriesInteractor: GitHubRepositoriesBusinessLogic, GitHubRepositoriesDataStore {
    var presenter: GitHubRepositoriesPresentationLogic?
    var worker: GitHubRepositoriesWorker?
    var keyword: String = ""
    
    // MARK: Do something
    
    func doSomething(request: GitHubRepositories.Something.Request) {
        worker = GitHubRepositoriesWorker()
        worker?.doSomeWork()
        
        let response = GitHubRepositories.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
