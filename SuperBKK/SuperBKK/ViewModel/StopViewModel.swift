//
//  StopViewModel.swift
//  SuperBKK
//
//  Created by Mate Papp on 2017. 10. 16..
//  Copyright © 2017. com.matepapp. All rights reserved.
//

import Foundation

class StopViewModel {
    private var stop: Stop
    
    var name: String {
        return stop.name
    }
    
    init(stop: Stop) {
        self.stop = stop
    }
}
