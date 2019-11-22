//
//  UserListViewController.swift
//  BaseSource
//
//  Created by Bao Nguyen on 11/21/19.
//  Copyright © 2019 Bao Nguyen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class UserListViewController: UIViewController {
    
    @IBOutlet weak var userTableView: UITableView!
    
    var userListViewModel: UserListViewModelType!
    
    private var users = [User]()
    private let dispose = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        bindingViewModel()
        userListViewModel.getUsers()
    }
    
    private func setupTableView() {
        userTableView.estimatedRowHeight = 40.0
        userTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func bindingViewModel() {
        userListViewModel.users
            .asDriver(onErrorJustReturn: [])
            .drive(onNext: { [weak self] (users) in
                self?.users = users
                self?.userTableView.reloadData()
            })
            .disposed(by: dispose)
        
        userListViewModel.isLoading
            .bind(to: self.view.rx.isShowHUD)
            .disposed(by: dispose)
        
        userListViewModel.error
            .map { $0.localizedDescription }
            .bind(to: self.rx.showError)
            .disposed(by: dispose)
    }
}

extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: UserInfoCell.self, at: indexPath)
        cell.user = users[indexPath.row]
        return cell
    }
}
