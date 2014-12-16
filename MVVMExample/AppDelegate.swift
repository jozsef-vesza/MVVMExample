//
//  AppDelegate.swift
//  MVVMExample
//
//  Created by József Vesza on 15/12/14.
//  Copyright (c) 2014 Jozsef Vesza. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let mealDownloadService = MealDownloadService()
        let menuViewModel = MenuViewModel(mealService: mealDownloadService)
        
        let topViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MenuViewController") as MenuViewController

        topViewController.viewModel = menuViewModel
        
        window?.rootViewController = topViewController
        
        return true
    }
}

