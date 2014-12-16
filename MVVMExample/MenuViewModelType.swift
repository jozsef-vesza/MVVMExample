//
//  MenuViewModelType.swift
//  MVVMExample
//
//  Created by József Vesza on 15/12/14.
//  Copyright (c) 2014 Jozsef Vesza. All rights reserved.
//

import Foundation

public protocol MenuViewModelType {
    var items: Bindable<[Meal]> { get }
}