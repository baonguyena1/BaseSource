//
//  UserListViewModel.swift
//  BaseSource
//
//  Created by Bao Nguyen on 11/21/19.
//  Copyright © 2019 Bao Nguyen. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol UserListViewModelType {
    var users: PublishRelay<[User]> { get set }
    var error: PublishRelay<Error> { get set }
    var isLoading: PublishRelay<Bool> { get set }
    
    func getUsers()
}

struct UserListViewModel: UserListViewModelType {
    private var repository: UserRepositoryType!
    
    var users = PublishRelay<[User]>()
    var error = PublishRelay<Error>()
    var isLoading = PublishRelay<Bool>()
    
    private let dispose = DisposeBag()
    
    init(repository: UserRepositoryType) {
        self.repository = repository
    }
    
    func getUsers() {
        isLoading.accept(true)
        repository.getUsers()
            .subscribe(onSuccess: { (users) in
                self.users.accept(users)
                self.isLoading.accept(false)
            }) { (error) in
                self.error.accept(error)
                self.isLoading.accept(false)
            }
            .disposed(by: dispose)
    }
}
