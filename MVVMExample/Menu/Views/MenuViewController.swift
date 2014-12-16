//
//  MenuViewController.swift
//  MVVMExample
//
//  Created by József Vesza on 15/12/14.
//  Copyright (c) 2014 Jozsef Vesza. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    
    var items: [Meal] = []
    var viewModel: MenuViewModel! {
        didSet {
            viewModel.items.bind { [unowned self] in
                self.items = $0
                
                dispatch_async(dispatch_get_main_queue()) { [unowned self] () in
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(
        tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            
        return items.count
    }
    
    override func tableView(
        tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let currentItem = items[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("mealCell") as MenuCell
        
        cell.mealNameLabel.text = currentItem.name
        cell.mealPriceLabel.text = "\(currentItem.price) Ft"
        
        return cell
    }
}
