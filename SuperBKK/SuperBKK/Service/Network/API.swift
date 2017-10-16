//
//  API.swift
//  SuperBKK
//
//  Created by Mate Papp on 2017. 10. 16..
//  Copyright © 2017. com.matepapp. All rights reserved.
//

import Foundation

enum API {
    enum Endpoint {
        static let stops = "http://bkk-api.supercharge.io/stops"
        static let selectedStop = "http://futar.bkk.hu/bkk-utvonaltervezo-api/ws/otp/api/where/arrivals-and-departures-for-stop.json?stopId=BKK_"
    }
}
