//
//  GitHubSearchMainWorker.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class GitHubSearchMainWorker {
    let db: RecentDBProtocol
    
    init(db: RecentDBProtocol) {
        self.db = db
    }
    
    func getRecentKeyword(filter: String?) -> [String] {
        db.getRecentKeyword(filter: filter)
    }
    
    func removeKeyword(_ keyword: String) {
        db.remove(keyword: keyword)
    }
    
    func removeKeywordAll() {
        db.removeKeywordAll()
    }
    
    func insertKeyword(_ keyword: String) {
        db.insert(keyword: keyword)
    }
}
