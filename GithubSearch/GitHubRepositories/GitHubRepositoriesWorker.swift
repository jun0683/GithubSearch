//
//  GitHubRepositoriesWorker.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class GitHubRepositoriesWorker {
    // https://docs.github.com/en/rest/search#search-repositories
    func searchRepositories(keyword: String,
                            page: Int = 1,
                            sort: String,
                            order: String,
                            completion: @escaping ((Result<GithubRepositoriesModel, Error>) -> Void)) {
        let url = "https://api.github.com/search/repositories?q=\(keyword)&page=\(page)&sort=\(sort)&order=\(order)"
        
        Network.shared.requestModel(urlString: url) { (result) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
