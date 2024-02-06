//
//  UserResponse.swift
//  NetworkLayer
//
//  Created by iPak Tulane on 06/02/24.
//

import Foundation
import Moya

enum UserAPI  {
    case getUsers
    // add your own cases
}

extension UserAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://659ed0e247ae28b0bd36c1e0.mockapi.io")!
    }
    
    var path: String {
        switch self {
        case .getUsers:
            "/siuzanna/api/users"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUsers:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getUsers:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getUsers:
            return .none
        }
    }
}

