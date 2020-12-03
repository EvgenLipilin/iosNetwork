//
//  RepoSctruct.swift
//  FirstWork
//
//  Created by Евгений on 29.11.2020.
//

import Foundation

struct Repository: Codable {
    
    var total_count: Int
    var items: [Items]
}

struct Items: Codable {
    var name: String
    var fullName: String
    var description: String?
    var owner: Owner
    
    private enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case description
        case name
        case owner
    }
}

struct Owner: Codable {
    var imageURL: String
    
    private enum CodingKeys: String, CodingKey {
        case imageURL = "avatar_url"
    }
}




