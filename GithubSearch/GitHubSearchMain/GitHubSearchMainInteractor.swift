//
//  GitHubSearchMainInteractor.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GitHubSearchMainBusinessLogic {
    func showRecentKeyWord(request: GitHubSearchMain.ShowRecentKeyWord.Request)
    func removeKeyWord(request: GitHubSearchMain.RemoveKeyWord.Request)
}

protocol GitHubSearchMainDataStore {
    //var name: String { get set }
}

class GitHubSearchMainInteractor: GitHubSearchMainBusinessLogic, GitHubSearchMainDataStore {
    var presenter: GitHubSearchMainPresentationLogic?
    var worker: GitHubSearchMainWorker? = GitHubSearchMainWorker()
    
    // MARK: Do something
    
    func showRecentKeyWord(request: GitHubSearchMain.ShowRecentKeyWord.Request) {
        guard let keywords = worker?.getRecentKeyword(filter: nil) else {
            return
        }
        presenter?.presentRecentKeyWord(response: .init(keywords: keywords))
    }
    
    func removeKeyWord(request: GitHubSearchMain.RemoveKeyWord.Request) {
        worker?.removeKeyword(request.keyword)
        
        showRecentKeyWord(request: .init(show: true))
    }
}
