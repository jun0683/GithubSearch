//
//  GithubRepositoriesModel.swift
//  GithubSearch
//
//  Created by hongjunkim on 2022/10/13.
//

import Foundation

// MARK: - GithubRepositoriesModel
struct GithubRepositoriesModel: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
    
    // MARK: - Item
    struct Item: Codable {
        let owner: Owner?
        let name: String
        let itemDescription: String?
        let stargazersCount: Int?
        let language: String?
        
        enum CodingKeys: String, CodingKey {
            case name
            case owner
            case itemDescription = "description"
            case stargazersCount = "stargazers_count"
            case language
        }
        
        // MARK: - Owner
        struct Owner: Codable {
            let login: String
            let avatarURL: String?
            
            enum CodingKeys: String, CodingKey {
                case login
                case avatarURL = "avatar_url"
            }
        }
    }
}

