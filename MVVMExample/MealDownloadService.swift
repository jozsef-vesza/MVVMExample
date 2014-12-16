//
//  MealDownloadService.swift
//  MVVMExample
//
//  Created by József Vesza on 16/12/14.
//  Copyright (c) 2014 Jozsef Vesza. All rights reserved.
//

import Foundation

public class MealDownloadService: MealDownloadServiceType {
    
    let mealUrl = "http://verdant-upgrade-554.appspot.com/soservices/mealmanager"
    
    public func downloadMeals(completion: [Meal] -> ()) {
        
        let request = NSURLRequest(URL: NSURL(string: mealUrl)!)
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig)
        
        let task = session.dataTaskWithRequest(request) { data, response, error in
            
            if data.length > 0 {
                
                let parsedData = NSJSONSerialization.JSONObjectWithData(
                    data,
                    options: .MutableContainers,
                    error: nil) as [[String: AnyObject]]
                
                let meals = parsedData.map { next -> Meal in
                    
                    let name = next["name"] as String
                    let price = next["price"] as Int
                    let imageAvailable = next["image"] != nil
                    
                    return Meal(name: name, price: price, image: nil, hasImage: imageAvailable)
                }
                
                completion(meals)
            }
            
        }
        
        task.resume()
    }

}