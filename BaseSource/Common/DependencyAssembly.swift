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
        
    }
    
    private class func registerViewModel() {
        
    }
    
    private class func registerService() {
        
    }
}
