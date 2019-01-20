//
//  ViewController.swift
//  P7WhitehousePetitions
//
//  Created by Encompass on 1/15/19.
//  Copyright © 2019 exiaj9. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
 var jsonObjects = [JsonObject]()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https:/swiftjsonapi.herokuapp.com/api/items"
        } else {
            urlString = "https:/swiftjsonapi.herokuapp.com/api/items"
        }
        
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
            showError()
        }
        // Do any additional setup after loading the view, typically from a nib.
    } //end viewDidLoad()


    
    
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return jsonObjects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            "Cell", for: indexPath)
        
        let theJsonObject = jsonObjects[indexPath.row]
        cell.textLabel?.text = theJsonObject.title
        cell.detailTextLabel?.text = theJsonObject.subtitle
        return cell
    }
 
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        if let theData = try? decoder.decode([JsonObject].self, from: json) {
            jsonObjects = theData
            tableView.reloadData()
        }
    }
    
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = jsonObjects[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message:
            "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
    }
  
    
} //end ViewController

