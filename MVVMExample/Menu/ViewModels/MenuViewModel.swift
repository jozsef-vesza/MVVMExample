//
//  MenuViewModel.swift
//  MVVMExample
//
//  Created by József Vesza on 15/12/14.
//  Copyright (c) 2014 Jozsef Vesza. All rights reserved.
//

import UIKit

public class MenuViewModel: MenuViewModelType {
    
    public var mealDownloadService: MealDownloadServiceType
    public var items: Bindable<[Meal]>
    
    public init(mealDownloadService: MealDownloadServiceType) {
        
        self.mealDownloadService = mealDownloadService
        items = Bindable([])
        loadData()
    }
    
    private func loadData() {
        mealDownloadService.downloadMeals { [unowned self] meals in
            self.items.value = meals
        }
    }
    
}