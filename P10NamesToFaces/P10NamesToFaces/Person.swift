//
//  Person.swift
//  P10NamesToFaces
//
//  Created by Encompass on 5/23/19.
//  Copyright © 2019 gthevirtuoso. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
