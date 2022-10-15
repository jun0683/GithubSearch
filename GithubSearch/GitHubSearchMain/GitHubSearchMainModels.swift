//
//  GitHubSearchMainModels.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum GitHubSearchMain {
    // MARK: Use cases
    
    enum ShowRecentKeyWord {
        struct Request {
            let show: Bool
        }
        
        struct Response {
            let keywords: [String]
        }
        
        struct ViewModel {
            let keywords: [String]
        }
    }
}
