//
//  RepositoryModel.swift
//  Github-iOS
//
//  Created by Gabriel on 17/03/25.
//

import Foundation


struct RepositorySearchResponse: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [Repository]?
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

struct Repository: Codable {
    let id: Int?
    let name: String?
    let fullName: String?
    let owner: Owner?
    let description: String?
    let stargazersCount: Int?
    let language: String?
    let htmlURL: String?
    let fork: Bool?
    let forks: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name, owner, description, language, fork, forks
        case fullName = "full_name"
        case stargazersCount = "stargazers_count"
        case htmlURL = "html_url"
    }
}

struct Owner: Codable {
    let login: String?
    let avatarURL: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}
