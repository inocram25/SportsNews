//
//  SubCatViewController+TableViewController.swift
//  SportsNews
//
//  Created by Alexandre Calil Marconi on 8/25/15.
//  Copyright (c) 2015 Alexandre Calil Marconi. All rights reserved.
//

import UIKit

extension SubCatViewController: UITableViewDataSource, UITableViewDelegate {

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subCategories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "subcat"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SubCatCustomCell
        let subCategoryName = subCategories[indexPath.row]
        
        cell.titleLabel.text = subCategoryName
        cell.iconView.image = UIImage(named: subCategoryName.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "-"))
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 1.0))
        footerView.backgroundColor = UIColor.whiteColor()
        
        return footerView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 1.0))
        footerView.backgroundColor = UIColor.whiteColor()
        
        return footerView
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let selectedCategoryTitle = (tableView.cellForRowAtIndexPath(indexPath) as! SubCatCustomCell).titleLabel.text
        performSegueWithIdentifier("showSubCategoriesNews", sender: selectedCategoryTitle)
    }
}
