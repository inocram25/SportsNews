//
//  HomeViewController+CustomView.swift
//  SportsNews
//
//  Created by Leonardo Maffei on 21/08/15.
//  Copyright (c) 2015 Alexandre Calil Marconi. All rights reserved.
//

import UIKit
import PINRemoteImage


extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate{
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return news.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let identifier = "homeCustomCell"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! HomeCustomCell
        
        cell.titleLabel.text = news[indexPath.row].title
        let url = NSURL(string:news[indexPath.row].imageURL)
        cell.imageView.pin_setImageFromURL(url)
        
        return cell
    }

    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

        let selectedNews = news[indexPath.row]
        performSegueWithIdentifier("readNews", sender: selectedNews)
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let widht = UIScreen.mainScreen().bounds.size.width
        
        return indexPath.row % 3 == 0 ? CGSize(width: widht, height: 180.0) : CGSize(width: widht/2, height: 180.0)
    }
}