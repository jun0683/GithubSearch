//
//  GitHubRepositoriesWorker.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class GitHubRepositoriesWorker {
    func searchRepositories(keyword: String, completion: @escaping ((Result<GithubRepositoriesModel, Error>) -> Void)) {
        Network.shared.requestModel(urlString: "https://api.github.com/search/repositories?q=\(keyword)") { (result) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}