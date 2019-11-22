//
//  Reactive+Helper.swift
//  BaseSource
//
//  Created by Bao Nguyen on 11/22/19.
//  Copyright © 2019 Bao Nguyen. All rights reserved.
//

import Foundation
import RxSwift

extension Reactive where Base: UIViewController {
    public var viewDidLoad: Observable<Void> {
        return methodInvoked(#selector(UIViewController.viewDidLoad))
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
}
