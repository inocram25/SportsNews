//
//  SubCatViewController.swift
//  SportsNews
//
//  Created by Alexandre Calil Marconi on 8/25/15.
//  Copyright (c) 2015 Alexandre Calil Marconi. All rights reserved.
//

import UIKit

class SubCatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var label: UILabel!

    var selectedCategory: String?
    var vetSubCat = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if selectedCategory == "Futebol" {
            label.text = selectedCategory
            vetSubCat = ["brasil","libertadores"]
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
