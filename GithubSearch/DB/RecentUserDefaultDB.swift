//
//  UserDefaultDB.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/16.
//

import Foundation

final class RecentUserDefaultDB: RecentDBProtocol {
    let dbkey = "recentUserDefaultDB"
    
    func getRecentKeyword(filter: String?) -> [String] {
        let keywords = getRecentKeyword()
        
        guard let filter = filter else {
            return keywords
        }
        
        return keywords.filter({ $0.localizedCaseInsensitiveContains(filter) })
    }
    
    func remove(keyword: String) {
        var keywords = getRecentKeyword()
        
        if let keywordIndex = keywords.firstIndex(of: keyword) {
            keywords.remove(at: keywordIndex)
        }
        
        setRecent(keywords: keywords)
    }
    
    func removeKeywordAll() {
        setRecent(keywords: [])
    }
    
    func insert(keyword: String) {
        var keywords = getRecentKeyword()
        
        guard keywords.contains(where: { $0.localizedCaseInsensitiveContains(keyword)}) == false else {
            return
        }
        
        keywords.insert(keyword, at: 0)
        
        setRecent(keywords: keywords)
    }
    
    private func getRecentKeyword() -> [String] {
        guard let keyWords = UserDefaults.standard.object(forKey: dbkey) as? [String] else {
            return []
        }
        return keyWords
    }
    
    private func setRecent(keywords: [String]) {
        UserDefaults.standard.set(keywords, forKey: dbkey)
        UserDefaults.standard.synchronize()
    }
}
