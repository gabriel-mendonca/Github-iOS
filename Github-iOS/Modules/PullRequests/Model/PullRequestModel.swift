//
//  PullRequestModel.swift
//  Github-iOS
//
//  Created by Gabriel on 18/03/25.
//

import Foundation

import Foundation

struct PullRequestModel: Codable {
    let title: String?
    let body: String?
    let createdAt: String?
    let htmlUrl: String?
    let user: User?

    enum CodingKeys: String, CodingKey {
        case title, body
        case createdAt = "created_at"
        case htmlUrl = "html_url"
        case user
    }
}

struct User: Codable {
    let login: String?
    let avatarUrl: String?

    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
}
