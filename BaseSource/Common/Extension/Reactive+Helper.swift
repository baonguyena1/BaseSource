//
//  Reactive+Helper.swift
//  BaseSource
//
//  Created by Bao Nguyen on 11/22/19.
//  Copyright © 2019 Bao Nguyen. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import MBProgressHUD

extension Reactive where Base: UIViewController {
    public var viewDidLoad: Observable<Void> {
        return methodInvoked(#selector(UIViewController.viewDidLoad))
            .map { _ in return }
    }
    
    public var viewDidLayoutSubviews: Observable<Void> {
        return methodInvoked(#selector(UIViewController.viewDidLayoutSubviews))
            .map { _ in return }
    }
    
    public var viewWillAppear: Observable<Void> {
        return methodInvoked(#selector(UIViewController.viewWillAppear))
            .map { _ in return }
    }
    
    public var viewDidAppear: Observable<Void> {
        return methodInvoked(#selector(UIViewController.viewDidAppear))
            .map { _ in return }
    }
    
    public var viewWillDisappear: Observable<Void> {
        return methodInvoked(#selector(UIViewController.viewWillDisappear))
            .map { _ in return }
    }
    
    public var viewDidDisappear: Observable<Void> {
        return methodInvoked(#selector(UIViewController.viewDidDisappear))
            .map { _ in return }
    }
    
    public var showError: Binder<String> {
        return Binder<String>.init(base.self, scheduler: MainScheduler.instance) { (controller, message) in
            controller.showError(message: message)
        }
    }
}

extension Reactive where Base: UIView {
    public var isShowHUD: Binder<Bool> {
        return Binder<Bool>.init(base.self, scheduler: MainScheduler.instance) { (view, isLoading) in
            if isLoading {
                MBProgressHUD.showAdded(to: view, animated: true)
            } else {
                MBProgressHUD.hide(for: view, animated: true)
            }
        }
    }
}
