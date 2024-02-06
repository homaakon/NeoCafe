//
//  UserResponse.swift
//  NetworkLayer
//
//  Created by iPak Tulane on 06/02/24.
//

import Foundation

struct UserResponse: Codable {
    let name, email: String
    let posts: Posts
    let id: String
}

struct Posts: Codable {
    let id: Int?
    let title, content: String?
    
    
    // uncomment for model mapping error
//    let note: String
}

