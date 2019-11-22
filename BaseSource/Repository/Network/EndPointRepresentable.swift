//
//  EndPointRepresentable.swift
//  BaseSource
//
//  Created by Bao Nguyen on 11/21/19.
//  Copyright © 2019 Bao Nguyen. All rights reserved.
//

import Alamofire

protocol EndPointRepresentable {
    var baseUrl: String { get }
    var method: HTTPMethod { get set }
    var parameters: Parameters? { get set }
    var headers: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
    var queries: [URLQueryItem]? { get set }
    
    var url: String { get }
    var queryString: String? { get }
}

extension EndPointRepresentable {
    var queryString: String? {
        self.queries?.compactMap { $0.description }.joined(separator: "&").urlEscaped
    }
    
    var url: String {
        if let queryString = self.queryString, !queryString.isEmpty {
            return String(format: "%@?%@", self.baseUrl, queryString)
        }
        return self.baseUrl
    }
}

class EndPointRepresent: EndPointRepresentable {
    var baseUrl: String = ""
    var method: HTTPMethod = .get
    var parameters: Parameters?
    var headers: HTTPHeaders?
    var encoding: ParameterEncoding = JSONEncoding.default
    var queries: [URLQueryItem]? = []
}
