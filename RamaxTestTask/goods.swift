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
    let price : Double
}

extension Item {
    init?(dictionary: Dictionary<String, String>) {
        guard let name = dictionary["name"],
            let description = dictionary["description"],
            let priceItem = dictionary["price"],
            let price = Double(priceItem) else {
                return nil
        }
        
        self.name = name
        self.description = description
        self.price = price
    }
}
