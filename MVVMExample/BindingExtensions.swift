//
//  BindingExtensions.swift
//  MVVMExample
//
//  Created by József Vesza on 15/12/14.
//  Copyright (c) 2014 Jozsef Vesza. All rights reserved.
//

import Foundation

public class Bindable<T> {
    
    typealias Listener = T -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            if let listener = listener {
                listener(value)
            }
        }
    }
    
    init(_ v: T) {
        value = v
    }
    
    public func bind(listener: Listener?) {
        self.listener = listener
    }
    
    public func bindAndFire(listener: Listener?) {
        
        self.listener = listener
        
        if let listener = self.listener {
            listener(value)
        }
    }
}