//
//  GitHubSearchMainWorker.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class GitHubSearchMainWorker {
    let defaultKeyWords: [String] = [
        "swift","mvvm","swiftgent","swiftlint","reactorkit","then","snapkit","almofire",
    ]
    
    func getRecentKeyword(filter: String?) -> [String] {
        guard let filter = filter else {
            return defaultKeyWords
        }
        
        //TODO: DB get
        return []
    }
}
