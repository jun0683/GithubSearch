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
    func removeAllKeyWord(request: GitHubSearchMain.RemoveKeyWordAll.Request)
    func filterKeyword(request: GitHubSearchMain.FilterKeyword.Request)
    func searchRepositories(request: GitHubSearchMain.SearchRepositories.Request)
}

protocol GitHubSearchMainDataStore {
    //var name: String { get set }
}

class GitHubSearchMainInteractor: GitHubSearchMainBusinessLogic, GitHubSearchMainDataStore {
    var presenter: GitHubSearchMainPresentationLogic?
    var worker: GitHubSearchMainWorker?
    
    init(worker: GitHubSearchMainWorker?) {
        self.worker = worker
    }
    
    // MARK: Do something
    
    func showRecentKeyWord(request: GitHubSearchMain.ShowRecentKeyWord.Request) {
        if request.show,
           let keywords = worker?.getRecentKeyword(filter: nil) {
            presenter?.presentRecentKeyWord(response: .init(keywords: keywords))
        } else {
            presenter?.presentRecentKeyWord(response: .init(keywords: []))
        }
    }
    
    func removeKeyWord(request: GitHubSearchMain.RemoveKeyWord.Request) {
        worker?.removeKeyword(request.keyword)
        
        showRecentKeyWord(request: .init(show: true))
    }
    
    func removeAllKeyWord(request: GitHubSearchMain.RemoveKeyWordAll.Request) {
        worker?.removeKeywordAll()
        
        showRecentKeyWord(request: .init(show: true))
    }
    
    func filterKeyword(request: GitHubSearchMain.FilterKeyword.Request) {
        let filter: String? = request.filter.isEmpty ? nil : request.filter
            
        guard let keywords = worker?.getRecentKeyword(filter: filter) else { return }
        
        presenter?.presentRecentKeyWord(response: .init(keywords: keywords))
    }
    
    func searchRepositories(request: GitHubSearchMain.SearchRepositories.Request) {
        worker?.insertKeyword(request.keyword)
        
        presenter?.presentSearchRepositories(response: .init(keyword: request.keyword))
    }
}
