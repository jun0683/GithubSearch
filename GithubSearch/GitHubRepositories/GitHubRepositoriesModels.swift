//
//  GitHubRepositoriesModels.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

/*
 1.사용자가 입력했던 text 를 통한 repository 검색 결과를 화면3 에서 확인할 수 있습니다.
 2.버튼과 ellipsis action sheet 에서 검색 옵션을 선택할 수 있습니다.
 3.화면4 에서 Sort 를 선택하면 화면5, Order 를 선택하면 화면6 이 나타납니다 .
 4.변경된 옵션을 통해서 갱신 Sort 와 Order 는 GitHub 에서 repository 검색을 위한 API 가 제공하는 옵션
 */

enum GitHubRepositories {
    struct ItemViewModel {
        let ownerIconUrl: String?
        let ownerName: String?
        let itemName: String?
        let itemDescription: String?
        let starCounter: String?
        let language: String?
    }
    
    // MARK: Use cases
    
    enum SearchRepositories {
        struct Request {
        }
        
        struct Response {
            let itemsRepositories: [GithubRepositoriesModel.Item]
        }
        
        struct ViewModel {
            let repositories: [ItemViewModel]
        }
    }
    
    enum SearchRepositoriesError {
        struct Response {
            let error: Error
        }
        
        struct ViewModel {
            let error: Error
        }
    }
}
