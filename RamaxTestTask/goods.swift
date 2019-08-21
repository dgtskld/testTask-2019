//
//  goods.swift
//  RamaxTestTask
//
//  Created by Vladimir Mazunin on 18/08/2019.
//  Copyright © 2019 Vladimir Mazunin. All rights reserved.
//

import Foundation

struct Item : Codable {
    let name : String
    let description : String?
    let price : String?
}

extension Item {
    init?(dictionary: Dictionary<String, String>) {
        guard let name = dictionary["name"],
            let description = dictionary["description"],
            let price = dictionary["price"] else {
                return nil
        }
        
        self.name = name
        self.description = description
        self.price = price
    }
}


//Большой косяк с архитектурой, да, здесь как временное решение,
//в работе такого делать не буду и потом исправлю
var goods = [Item]()
