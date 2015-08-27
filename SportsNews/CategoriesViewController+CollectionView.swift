//
//  HomeViewController+CustomView.swift
//  SportsNews
//
//  Created by Leonardo Maffei on 21/08/15.
//  Copyright (c) 2015 Alexandre Calil Marconi. All rights reserved.
//

import UIKit
import PINRemoteImage


extension CategoriesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate{
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categories.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let identifier = "categoryCustomCell"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! CategoryCustomCell
        
        cell.imageView.image = UIImage(named:categories[indexPath.row])
        cell.imageView.layer.borderWidth = 1
        cell.imageView.layer.masksToBounds = false
        cell.imageView.layer.borderColor = UIColor.whiteColor().CGColor
        cell.imageView.layer.cornerRadius = cell.imageView.frame.size.width / 2
        cell.imageView.clipsToBounds = true
        
        cell.titleLabel.text = categories[indexPath.row]
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let title = (collectionView.cellForItemAtIndexPath(indexPath) as! CategoryCustomCell).titleLabel.text
        if indexPath.row < 2{
            performSegueWithIdentifier("showSubCategories", sender: title)
        }
        else{
            
            performSegueWithIdentifier("showCategoryNews", sender: title)
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: 160.0, height: 160.0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let border = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let itemWidth = flowLayout.itemSize.width + flowLayout.minimumInteritemSpacing
        let totalWidth = collectionView.bounds.width - border
        let numberOfCells = floor(totalWidth / itemWidth)
        let usedSpace = itemWidth * numberOfCells
        let bonusSpace = flowLayout.minimumInteritemSpacing * numberOfCells
        
        let edgeInsets = floor((totalWidth - usedSpace + bonusSpace) / (numberOfCells + 4.0))
        
        return UIEdgeInsets(top: flowLayout.sectionInset.top, left: edgeInsets, bottom: flowLayout.sectionInset.bottom, right: edgeInsets)
    }
    
}
