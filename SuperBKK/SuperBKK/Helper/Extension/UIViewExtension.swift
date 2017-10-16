//
//  UIViewExtension.swift
//  SuperBKK
//
//  Created by Mate Papp on 2017. 10. 16..
//  Copyright © 2017. com.matepapp. All rights reserved.
//

import Foundation
import UIKit

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

extension NIBLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
