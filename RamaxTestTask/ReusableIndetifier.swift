//
//  ReusableIndetifier.swift
//  RamaxTestTask
//
//  Created by Vladimir Mazunin on 18/08/2019.
//  Copyright © 2019 Vladimir Mazunin. All rights reserved.
//

import Foundation

protocol ReusableIdentifier: class {
    static var reuseIdentifier: String { get }
}

extension ReusableIdentifier {
    static var reuseIdentifier: String {
        return "\(self)"
    }
}
