//
//  ResponseModel.swift
//  LT_Demo_APP
//
//  Created by Hiromu Tsuruta on 2019/01/22.
//  Copyright © 2019年 Hiromu Tsuruta. All rights reserved.
//

import UIKit

// MARK: - Object

struct MainViewModel: Codable {
    
    let renderedBody: String
    let body: String
    let title: String
    let url: URL?
    let user: User?
    
    enum Keys: String, CodingKey {
        case renderedBody, body, title, url, user
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        renderedBody = try container.decode(String.self, forKey: .renderedBody)
        body = try container.decode(String.self, forKey: .body)
        title = try container.decode(String.self, forKey: .title)
        url = URL(string: try container.decode(String.self, forKey: .url))
        user = try? container.decode(User.self, forKey: .user)
    }
}

struct User: Codable {
    
    let description: String?
    let followeesCount: Int
    let followersCount: Int
    let id: String?
    let location: String?
    let name: String?
    let organization: String?
    let profileImageUrl: URL?
    
    enum Keys: String, CodingKey {
        case description, followeesCount, followersCount, id, location, name, organization, profileImageUrl
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        description = try? container.decode(String.self, forKey: .description)
        followeesCount = try container.decode(Int.self, forKey: .followeesCount)
        followersCount = try container.decode(Int.self, forKey: .followersCount)
        id = try? container.decode(String.self, forKey: .id)
        location = try? container.decode(String.self, forKey: .location)
        name = try? container.decode(String.self, forKey: .name)
        organization = try? container.decode(String.self, forKey: .organization)
        profileImageUrl = URL(string: try container.decode(String.self, forKey: .profileImageUrl))
    }
}
