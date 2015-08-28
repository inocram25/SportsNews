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
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.tableView.backgroundColor = UIColor(patternImage: UIImage(named: "darkSports_pattern")!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if selectedCategory == "Futebol" {
            label.text = selectedCategory
            vetSubCat =
                    ["ABC-RN","America-MG","America-RN","Atletico-GO",
                    "Atletico-MG","Avai","Bahia",
                    "Boa Esporte","Botafogo","Bragantino",
                    "Ceara","Chapecoense","Corinthians",
                    "Coritiba","CRB","Criciuma","Cruzeiro",
                    "Figueirense","Flamengo","Fluminense",
                    "Goias","Gremio","Guarani",
                    "Icasa","Inter-RS","Joinville",
                    "Luverdense","Macae","Nautico",
                    "Oeste","Palmeiras","Parana Clube",
                    "Paysandu","Ponte Preta","Portuguesa",
                    "Sampaio Correa","Santa Cruz","Santos",
                    "Sao Paulo","Sport Club","Vasco","Vila Nova","Vitoria"]
        }
        //TO-DO: fazer as subcateogiras corretamente.

        imageView.image = UIImage(named: "Futebol")
//        imageView.layer.borderWidth = 0.5
//        imageView.layer.masksToBounds = false
//        imageView.layer.borderColor = UIColor.whiteColor().CGColor
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
