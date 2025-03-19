//
//  PullRequestMakeDummy.swift
//  Github-iOSTests
//
//  Created by Gabriel on 19/03/25.
//

import Foundation
@testable import Github_iOS

extension PullRequestModel {
    
    public static func dummy(title: String? = "title teste",
                             body: String? = "body teste",
                             createdAt: String? = "data teste",
                             htmlUrl: String? = "html teste",
                             user: User? = nil) -> PullRequestModel {
        return PullRequestModel(title: title,
                                body: body,
                                createdAt: createdAt,
                                htmlUrl: htmlUrl,
                                user: user)
    }
    
    public static func userDummy(login: String? = "login",
                                 avatarUrl: String? = "avatar") -> User {
        return User(login: login,
                    avatarUrl: avatarUrl)
    }
}
