//
//  UserRepository.swift
//  BaseSource
//
//  Created by Bao Nguyen on 11/21/19.
//  Copyright © 2019 Bao Nguyen. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

protocol UserRepositoryType {
    func getUsers() -> Single<[User]>
}

struct UserRepository: UserRepositoryType {
    private var apiClient: APIClientType!
    
    init(api: APIClientType) {
        apiClient = api
    }
    
    func getUsers() -> Single<[User]> {
        let endpoint = EndPointRepresent()
        endpoint.baseUrl = EndPoint.getUsers.url
        endpoint.method = .get
        return apiClient.requestList(endpoint)
    }
}
