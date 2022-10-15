//
//  GitHubSearchMainPresenter.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GitHubSearchMainDataSource {
    
}

protocol GitHubSearchMainPresentationLogic {
    func presentSomething(response: GitHubSearchMain.Something.Response)
}

class GitHubSearchMainPresenter: GitHubSearchMainPresentationLogic, GitHubSearchMainDataSource {
    weak var viewController: GitHubSearchMainDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: GitHubSearchMain.Something.Response) {
        let viewModel = GitHubSearchMain.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
