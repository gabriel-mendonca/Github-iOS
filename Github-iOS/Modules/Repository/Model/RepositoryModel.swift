//
//  RepositoryModel.swift
//  Github-iOS
//
//  Created by Gabriel on 17/03/25.
//

import Foundation

struct RepositorySearchResponse: Codable {
    let items: [Repository]?
}

struct Repository: Codable {
    let id: Int?
    let name: String?
    let fullName: String?
    let owner: Owner?
    let description: String?
    let stargazersCount: Int?
    let forks: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name, owner, description, forks
        case fullName = "full_name"
        case stargazersCount = "stargazers_count"
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
