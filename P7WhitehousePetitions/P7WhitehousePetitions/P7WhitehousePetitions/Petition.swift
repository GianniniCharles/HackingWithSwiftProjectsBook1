//
//  Petition.swift
//  P7WhitehousePetitions
//
//  Created by Encompass on 1/15/19.
//  Copyright © 2019 exiaj9. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
