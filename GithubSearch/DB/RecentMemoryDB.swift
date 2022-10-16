//
//  MemoryDB.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/16.
//

import Foundation

protocol RecentDBProtocol {
    func getRecentKeyword(filter: String?) -> [String]
    func remove(keyword: String)
    func removeKeywordAll()
    func insert(keyword: String)
}

final class RecentMemoryDB: RecentDBProtocol {
    private var memmoryKeyWords: [String] = []
    
    func getRecentKeyword(filter: String?) -> [String] {
        guard let filter = filter else {
            return memmoryKeyWords
        }
        
        return memmoryKeyWords.filter({ $0.localizedCaseInsensitiveContains(filter) })
    }
    
    func remove(keyword: String) {
        if let keywordIndex = memmoryKeyWords.firstIndex(of: keyword) {
            memmoryKeyWords.remove(at: keywordIndex)
        }
    }
    
    func removeKeywordAll() {
        memmoryKeyWords.removeAll()
    }
    
    func insert(keyword: String) {
        guard memmoryKeyWords.contains(where: { $0.localizedCaseInsensitiveContains(keyword)}) == false else {
            return
        }
        
        memmoryKeyWords.insert(keyword, at: 0)
    }
}
