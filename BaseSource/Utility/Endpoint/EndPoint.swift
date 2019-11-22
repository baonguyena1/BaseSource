//
//  EndPoint.swift
//  BaseSource
//
//  Created by Bao Nguyen on 11/21/19.
//  Copyright © 2019 Bao Nguyen. All rights reserved.
//

import Foundation

enum EndPoint {
    case getUsers
}

extension EndPoint {
    var url: String {
        return baseUrl.appending(path)
    }
    
    private var host: String {
        return "https://jsonplaceholder.typicode.com"
    }
    
    private var baseUrl: String {
        return host
    }
    
    private var path: String {
        return pathName
    }
    
    private var pathName: String {
        switch self {
        case .getUsers:
            return EndPointPathName.kUsers
        }
    }
}
