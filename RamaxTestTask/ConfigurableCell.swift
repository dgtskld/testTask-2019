//
//  ConfigurableCell.swift
//  RamaxTestTask
//
//  Created by Vladimir Mazunin on 19/08/2019.
//  Copyright © 2019 Vladimir Mazunin. All rights reserved.
//

import Foundation

protocol ConfigurableCell {
    associatedtype Object
    func configure(object: Object)
}
