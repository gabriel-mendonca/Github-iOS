//
//  MakeDummy.swift
//  Github-iOSTests
//
//  Created by Gabriel on 19/03/25.
//

import Foundation

@testable import Github_iOS

extension RepositorySearchResponse {
    
    public static func dummy() -> RepositorySearchResponse {
        return RepositorySearchResponse(items: items())
    }
    
    public static func items(id: Int? = 0,
                             name: String? = "teste",
                             fullName: String? = "full name teste",
                             owner: Owner? = nil,
                             description: String? = "description teste",
                             stargazersCount: Int? = 0,
                             forks: Int? = 0) -> [Repository] {
    return [Repository(id: 0,
                       name: name,
                       fullName: fullName,
                       owner: owner,
                       description: description,
                       stargazersCount: stargazersCount,
                       forks: forks)]
    }
    
    public static func owner(login: String? = "login teste",
                             avatarURL: String? = "image URL") -> Owner {
        return Owner(login: login,
                     avatarURL: avatarURL)
    }
}
