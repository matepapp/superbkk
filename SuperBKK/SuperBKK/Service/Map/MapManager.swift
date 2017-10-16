//
//  MapManager.swift
//  SuperBKK
//
//  Created by Mate Papp on 2017. 10. 16..
//  Copyright © 2017. com.matepapp. All rights reserved.
//

import Foundation
import CoreLocation

class MapManager {
    func isInZone(zone: Double, from: CLLocation, to: CLLocation) -> Bool {
        let distance = to.distance(from: from)
        
        return distance <= zone
    }
}
