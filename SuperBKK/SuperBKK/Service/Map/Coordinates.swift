//
//  Coordinates.swift
//  SuperBKK
//
//  Created by Mate Papp on 2017. 10. 16..
//  Copyright © 2017. com.matepapp. All rights reserved.
//

import Foundation
import CoreLocation

enum Coordinates {
    static let deak = CLLocation(latitude: Deak.lat, longitude: Deak.long)
    
    private enum Deak {
        static let lat = 47.497509
        static let long = 19.054193
    }
}
