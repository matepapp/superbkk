//
//  Result.swift
//  SuperBKK
//
//  Created by Mate Papp on 2017. 10. 16..
//  Copyright © 2017. com.matepapp. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(String)
}
