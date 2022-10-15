//
//  GitHubSearchMainRouter.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

protocol GitHubSearchMainRoutingLogic {
    func routeToGitHubRepositories(keyword: String)
}

protocol GitHubSearchMainDataPassing {
    var dataStore: GitHubSearchMainDataStore? { get }
}

class GitHubSearchMainRouter: NSObject, GitHubSearchMainRoutingLogic, GitHubSearchMainDataPassing {
    weak var viewController: GitHubSearchMainViewController?
    var dataStore: GitHubSearchMainDataStore?
    
    func routeToGitHubRepositories(keyword: String) {
        let viewcontroller = GitHubRepositoriesViewController()
        
        viewController?.navigationController?.pushViewController(viewcontroller, animated: true)
    }
}
