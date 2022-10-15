//
//  GitHubSearchMainPresenter.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GitHubSearchMainDataSource {
    var keywords: [String] { get }
}

protocol GitHubSearchMainPresentationLogic {
    func presentRecentKeyWord(response: GitHubSearchMain.ShowRecentKeyWord.Response)
    func presentSearchRepositories(response: GitHubSearchMain.SearchRepositories.Response)
}

class GitHubSearchMainPresenter: GitHubSearchMainPresentationLogic, GitHubSearchMainDataSource {
    weak var viewController: GitHubSearchMainDisplayLogic?
    
    // MARK: DataSource
    var keywords: [String] = []
    
    // MARK: Do something
    
    func presentRecentKeyWord(response: GitHubSearchMain.ShowRecentKeyWord.Response) {
        keywords = response.keywords
        
        viewController?.displayRecentKeyWord(viewModel: .init(keywords: response.keywords))
    }
    
    func presentSearchRepositories(response: GitHubSearchMain.SearchRepositories.Response) {
        viewController?.displaySearchRepositories(viewModel: .init(keyword: response.keyword))
    }
}
