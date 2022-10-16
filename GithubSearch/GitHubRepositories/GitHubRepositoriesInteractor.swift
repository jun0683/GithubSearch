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
    func searchRepositoriesMore(request: GitHubRepositories.SearchRepositoriesMore.Request)
    func searchRepositoriesOptions(request: GitHubRepositories.SearchRepositoriesOptions.Request)
}

protocol GitHubRepositoriesDataStore {
    var keyword: String { get set }
}

class GitHubRepositoriesInteractor: GitHubRepositoriesBusinessLogic, GitHubRepositoriesDataStore {
    var presenter: GitHubRepositoriesPresentationLogic?
    var worker: GitHubRepositoriesWorker? = GitHubRepositoriesWorker()
    var keyword: String = ""
    var sort: String = ""
    var order: String = ""
    var fetchModel = GitHubRepositoriesFetchingModel()
    
    // MARK: Do something
    
    func searchRepositories(request: GitHubRepositories.SearchRepositories.Request) {
        fetchModel.clear()
        searchRepositories(keyword: keyword, page: 1, sort: sort, order: order)
    }
    
    func searchRepositoriesMore(request: GitHubRepositories.SearchRepositoriesMore.Request) {
        searchRepositories(keyword: keyword, page: fetchModel.page+1, sort: sort, order: order)
    }
    
    func searchRepositoriesOptions(request: GitHubRepositories.SearchRepositoriesOptions.Request) {
        switch request.option {
        case .sort(type: let sortType):
            sort = sortType.rawValue
        case .order(type: let orderType):
            order = orderType.rawValue
        }
        fetchModel.clear()
        searchRepositories(keyword: keyword, page: 1, sort: sort, order: order)
    }
    
    private func searchRepositories(keyword: String,
                                    page: Int,
                                    sort: String,
                                    order: String) {
        guard fetchModel.isLoading == false,
              fetchModel.isLastPage == false else { return }
        fetchModel.isLoading = true
        
        worker?.searchRepositories(keyword: keyword,
                                   page: page,
                                   sort: sort,
                                   order: order,
                                   completion: { [weak self] result in
            switch result{
            case .success(let model):
                self?.fetchModel.append(items: model.items, page: page)
                self?.presentSearchRepositories()
            case .failure(let error):
                self?.presenter?.presentError(response: .init(error: error))
            }
            self?.fetchModel.isLoading = false
        })
    }
    
    private func presentSearchRepositories() {
        presenter?.presentSearchRepositories(response: .init(itemsRepositories: fetchModel.items))
    }
}

final class GitHubRepositoriesFetchingModel {
    
    private(set) var items: [GithubRepositoriesModel.Item] = []
    private(set) var page: Int = 1
    private(set) var isLastPage: Bool = false

    var isLoading: Bool = false
    let pageSize: Int = 30
    
    func clear() {
        items = []
        page = 0
        isLastPage = false
    }

    func append(items: [GithubRepositoriesModel.Item]?, page: Int) {
        guard let items = items else { return }
        self.items.append(contentsOf: items)
        self.page = page
        isLastPage = items.count < pageSize
    }
}
