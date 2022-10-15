//
//  GitHubSearchMainModels.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/15.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

/*
 1.최근 검색 순으로 검색 이력을 확인
 2.검색 이력 우측의 X 버튼을 누르게 되면 해당 이력만 삭제
 3.우측 상단의 Clear 버튼을 누르면 모든 이력을 삭제
 4.사용자가 text를 입력하면 text 를 포함하는 이력만 확인
 5.키보드의 search 혹은 검색 이력을 선택하게 되면 화면3 으로 이동+최근검색 이력 추가
 */

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
    
    enum RemoveKeyWord {
        struct Request {
            let keyword: String
        }
    }
}
