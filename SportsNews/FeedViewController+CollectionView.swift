//
//  FeedViewController+CollectionView.swift
//  SportsNews
//
//  Created by Leonardo Maffei on 26/08/15.
//  Copyright (c) 2015 Alexandre Calil Marconi. All rights reserved.
//


import UIKit
import PINRemoteImage

extension FeedViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate{
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return news.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let identifier = "feedCustomCell"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! FeedCustomCell
        
        cell.titleLabel.text = news[indexPath.row].title
        if let urlString = news[indexPath.row].imageURL{
            cell.imageView.pin_setImageFromURL(NSURL(string: urlString), placeholderImage: UIImage(named: "placeholder"))
        }
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let selectedNews = news[indexPath.row]
        performSegueWithIdentifier("readNewsFromMyFeed", sender: selectedNews)
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let widht = UIScreen.mainScreen().bounds.size.width
        
        return CGSize(width: widht, height: 180.0)
    }
}