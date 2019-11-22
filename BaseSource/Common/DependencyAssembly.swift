//
//  DependencyAssembly.swift
//  BaseSource
//
//  Created by Bao Nguyen on 11/21/19.
//  Copyright © 2019 Bao Nguyen. All rights reserved.
//

import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        Container.loggingFunction = nil
        registerStoryboard()
        registerViewModel()
        registerService()
    }
    
    private class func registerStoryboard() {
        defaultContainer.storyboardInitCompleted(ViewController.self) { (r, c) in
            c.userListViewModel = r.resolve(UserListViewModelType.self)
        }
    }
    
    private class func registerViewModel() {
        defaultContainer.register(UserListViewModelType.self) { (r) in
            return UserListViewModel(repository: r.resolve(UserRepositoryType.self)!)
        }
    }
    
    private class func registerService() {
        // Register APIClient with singleton
        defaultContainer.register(APIClientType.self) { _ in
            return APIClient()
        }
        .inObjectScope(.container)
        
        defaultContainer.register(UserRepositoryType.self) { (r) in
            return UserRepository(api: r.resolve(APIClientType.self)!)
        }
    }
}
