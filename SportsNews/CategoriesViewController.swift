//
//  CategoriesViewController.swift
//  SportsNews
//
//  Created by Alexandre Calil Marconi on 8/24/15.
//  Copyright (c) 2015 Alexandre Calil Marconi. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
        
    @IBOutlet weak var collectionView: UICollectionView!
    
    let categories = ["Futebol","Automobilismo","Basquete",
                     "Ciclismo","Atletismo","Corrida",
                     "Natacao","Tenis","Volei","Outros"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = UIColor(patternImage: UIImage(named: "whiteSports_pattern")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        println("WARNING!")
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSubCategories" {
            let title = sender as! String
            let vc = segue.destinationViewController as! SubCatViewController
            vc.selectedCategory = title
        }
        if segue.identifier == "showCategoryNews" {
            let title = sender as! String
            let vc = segue.destinationViewController as! FeedViewController
            vc.selectedCategory = title
        }
    }

}
