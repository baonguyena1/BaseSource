//
//  APIClient.swift
//  BaseSource
//
//  Created by Bao Nguyen on 11/21/19.
//  Copyright © 2019 Bao Nguyen. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

protocol APIClientType {
    func request<T: Codable>(_ endpoint: EndPointRepresentable) -> Single<T>
    
    func requestList<T: Codable>(_ endpoint: EndPointRepresentable) -> Single<[T]>
}

struct APIClient: APIClientType {
    private var manager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = kTimeoutInterval
        let manager = Alamofire.SessionManager(configuration: configuration, serverTrustPolicyManager: nil)
        return manager
    }()
    
    private var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }()
    
    @discardableResult
    func request<T: Codable>(_ endpoint: EndPointRepresentable) -> Single<T> {
        return Single.create { (single) -> Disposable in
            let request = self.request(endpoint) { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        let object = try self.decoder.decode(T.self, from: data)
                        single(.success(object))
                    } catch let error {
                        single(.error(error))
                    }
                case .failure(let error):
                    single(.error(error))
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }.debug(endpoint.url)
    }
    
    @discardableResult
    func requestList<T: Codable>(_ endpoint: EndPointRepresentable) -> Single<[T]> {
        return Single.create { (single) -> Disposable in
            let request = self.request(endpoint) { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        let object = try self.decoder.decode([T].self, from: data)
                        single(.success(object))
                    } catch let error {
                        single(.error(error))
                }
                case .failure(let error):
                    single(.error(error))
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }.debug(endpoint.url)
    }
    
    @discardableResult
    private func request(_ endpoint: EndPointRepresentable, completion: @escaping((DataResponse<Data>) -> Void)) -> DataRequest {
        let dataRequest = manager.request(endpoint.url, method: endpoint.method, parameters: endpoint.parameters, encoding: endpoint.encoding, headers: endpoint.headers)
            .responseData(queue: DispatchQueue.global(qos: .utility)) { (response) in
                completion(response)
        }
        return dataRequest
    }
}
