//
//  UserLog.swift
//  FirstWork
//
//  Created by Евгений on 06.12.2020.
//

import Foundation

struct User: Decodable {
    
    let login: String
    let avatarUrl: String
    
    
    static func logFromJson(_ jsonData: Data)-> User? {
        
        let decoder = JSONDecoder()
        
       decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let result = try? decoder.decode(User.self, from: jsonData) else { return nil}
        
        print(result)
        return result
    }
    
}
