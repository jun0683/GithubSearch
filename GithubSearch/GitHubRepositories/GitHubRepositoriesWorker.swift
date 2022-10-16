//
//  GitHubRepositoriesWorker.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class GitHubRepositoriesWorker {
    func searchRepositories(keyword: String, page: Int = 1, completion: @escaping ((Result<GithubRepositoriesModel, Error>) -> Void)) {
        let url = "https://api.github.com/search/repositories?q=\(keyword)&page=\(page)"
        
        Network.shared.requestModel(urlString: url) { (result) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
