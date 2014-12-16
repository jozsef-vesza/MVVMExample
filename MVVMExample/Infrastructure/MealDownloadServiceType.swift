//
//  MealDownloadServiceType.swift
//  MVVMExample
//
//  Created by József Vesza on 16/12/14.
//  Copyright (c) 2014 Jozsef Vesza. All rights reserved.
//

import Foundation

public protocol MealDownloadServiceType {
    func downloadMeals(completion: [Meal] -> ())
}