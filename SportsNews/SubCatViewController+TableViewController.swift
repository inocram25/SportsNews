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
        return vetSubCat.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "subcat"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SubCatCustonCell
        
        let subCategoryName = vetSubCat[indexPath.row]
        cell.label.text = subCategoryName
        cell.iconView.image = UIImage(named: "test")
        //cell.iconView.layer.borderWidth = 1
        cell.iconView.layer.masksToBounds = false
        //cell.iconView.layer.borderColor = UIColor.redColor().CGColor
        cell.iconView.layer.cornerRadius = cell.iconView.frame.size.width / 2
        cell.iconView.clipsToBounds = true
        
        
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
    
    /*func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }*/
}
