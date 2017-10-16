//
//  Reusable.swift
//  SuperBKK
//
//  Created by Mate Papp on 2017. 10. 16..
//  Copyright © 2017. com.matepapp. All rights reserved.
//

import Foundation

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}
