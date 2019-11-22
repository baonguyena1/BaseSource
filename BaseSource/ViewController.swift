//
//  ViewController.swift
//  BaseSource
//
//  Created by Bao Nguyen on 11/21/19.
//  Copyright © 2019 Bao Nguyen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    var userListViewModel: UserListViewModelType!
    
    private let dispose = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindingViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userListViewModel.getUsers()
    }
    
    private func bindingViewModel() {
        userListViewModel.users
            .asDriver(onErrorJustReturn: [])
            .drive(onNext: { [weak self] (users) in
            })
            .disposed(by: dispose)
    }

}
