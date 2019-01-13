//
//  HomeViewController.swift
//  Project4
//
//  Created by Giannini Charles on 12/2/18.
//  Copyright © 2018 exiaj9. All rights reserved.
//

import Foundation

import UIKit

class HomeViewController: UITableViewController {
    var websites = ["apple.com", "hackingwithswift.com"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Simple Browser"
        // Do any additional setup after loading the view, typically from a nib.
       }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Website", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WebsiteVC") as? ViewController {
            // 2: success! Set its selectedImage property
            vc.selectedWebsite = websites[indexPath.row]
            vc.websites = websites
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    
}

