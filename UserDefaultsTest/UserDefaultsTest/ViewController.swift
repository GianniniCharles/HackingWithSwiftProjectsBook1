//
//  ViewController.swift
//  UserDefaultsTest
//
//  Created by Encompass on 5/23/19.
//  Copyright © 2019 gthevirtuoso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let defaults = UserDefaults.standard
        defaults.set(25, forKey: "Age")
        defaults.set(true, forKey: "UseTouchID")
        defaults.set(CGFloat.pi, forKey: "Pi")
        defaults.set("Paul Hudson", forKey: "Name")
        defaults.set(Date(), forKey: "LastRun")
        
        let array = ["Hello", "World"]
        defaults.set(array, forKey: "SavedArray")
        
        let dict = ["Name": "Paul", "Country": "UK"]
        defaults.set(dict, forKey: "SavedDict")
        
        let readArray = defaults.object(forKey: "SavedArray") as? [String] ?? [String]()
        print(readArray)
        let readDict = defaults.object(forKey: "SavedDict") as? [String: String] ?? [String: String]()
        print(readDict)
        getSizeOfUserDefaults()
    }

     func getSizeOfUserDefaults() -> Int? {
        guard let libraryDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first else {
            return nil
        }
        
        guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
            return nil
        }
        
        let filepath = "\(libraryDir)/Preferences/\(bundleIdentifier).plist"
        let filesize = try? FileManager.default.attributesOfItem(atPath: filepath)
        let retVal = filesize?[FileAttributeKey.size]
        print(retVal)
        return retVal as? Int
    }

}

