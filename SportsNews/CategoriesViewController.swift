//
//  CategoriesViewController.swift
//  SportsNews
//
//  Created by Alexandre Calil Marconi on 8/24/15.
//  Copyright (c) 2015 Alexandre Calil Marconi. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
        
    let categories = ["Futebol","Basquete","Ciclismo","Atletismo","Corrida","Natacao","Tenis","Volei","Outros"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSubCategories" {
            let title = sender as! String
            let vc = segue.destinationViewController as! SubCatViewController
            vc.selectedCategory = title
        }
    }

}
