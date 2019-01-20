//
//  ViewController.swift
//  P7WhitehousePetitions
//
//  Created by Encompass on 1/15/19.
//  Copyright © 2019 exiaj9. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
 var petitions = [jsonObject]()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https:/swiftjsonapi.herokuapp.com/api/items"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    } //end viewDidLoad()


    
    
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            "Cell", for: indexPath)
        
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.subtitle
        return cell
    }
 
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        if let theData = try? decoder.decode([jsonObject].self, from: json) {
            petitions = theData
            tableView.reloadData()
        }
    }
    
    
} //end ViewController

