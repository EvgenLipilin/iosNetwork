//
//  UserLog.swift
//  FirstWork
//
//  Created by Евгений on 06.12.2020.
//

import Foundation

struct User: Decodable {
    
    var login: String
    var imageURL: String
    
    
    static func logFromJson(json: Data)-> User? {
    
        JSONDecoder().keyDecodingStrategy = .convertFromSnakeCase
        
        guard let result = try? JSONDecoder().decode(User.self, from: json) else { return nil}
        
        return result
    }
    
}
