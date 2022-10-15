//
//  GitHubSearchMainInteractor.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GitHubSearchMainBusinessLogic {
    func doSomething(request: GitHubSearchMain.Something.Request)
}

protocol GitHubSearchMainDataStore {
    //var name: String { get set }
}

class GitHubSearchMainInteractor: GitHubSearchMainBusinessLogic, GitHubSearchMainDataStore {
    var presenter: GitHubSearchMainPresentationLogic?
    var worker: GitHubSearchMainWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func doSomething(request: GitHubSearchMain.Something.Request) {
        worker = GitHubSearchMainWorker()
        worker?.doSomeWork()
        
        let response = GitHubSearchMain.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
