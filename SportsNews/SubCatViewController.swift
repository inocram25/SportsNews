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

    var selectedCategory: String?
    var subCategories = [String]()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        println("WARNING!")
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBarHidden = false
        self.title = selectedCategory
        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "darkSports_pattern")!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if selectedCategory == "Futebol" {
            imageView.image = UIImage(named: "Futebol")
            subCategories =
                    ["Selecao Brasileira","Futebol Internacional","Futebol Feminino",
                    "ABC-RN","America-MG","America-RN","Atletico-GO",
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
        else if selectedCategory == "Automobilismo" {
            imageView.image = UIImage(named: "Automobilismo")
            subCategories = ["Formula-1","Formula-Indy","Motor","Stockcar"]
        }

    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSubCategoriesNews" {
            let title = sender as! String
            let vc = segue.destinationViewController as! FeedViewController
            vc.selectedCategory = title
        }
    }

}
