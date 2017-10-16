//
//  Stop.swift
//  SuperBKK
//
//  Created by Mate Papp on 2017. 10. 16..
//  Copyright © 2017. com.matepapp. All rights reserved.
//

import Foundation

// To parse the JSON, add this file to your project and do:
//
//   let stop = Stop.from(json: jsonString)!

import Foundation

struct Stop: Codable {
    let stopDirection: Double?
    let parentStation: String
    let locationType: Int?
    let code: String
    let lat: Double
    let lon: Double
    let name: String
    let ID: String
    let wheelchairBoarding: Int?
}

// Serialization extensions

extension Stop {
    static func from(json: String, using encoding: String.Encoding = .utf8) -> Stop? {
        guard let data = json.data(using: encoding) else { return nil }
        return Stop.from(data: data)
    }
    
    static func from(data: Data) -> Stop? {
        let decoder = JSONDecoder()
        return try? decoder.decode(Stop.self, from: data)
    }
    
    var jsonData: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
    
    var jsonString: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension Array where Element == Stop {
    static func from(json: String, using encoding: String.Encoding = .utf8) -> [Stop]? {
        guard let data = json.data(using: encoding) else { return nil }
        return [Stop].from(data: data)
    }
    
    static func from(data: Data) -> [Stop]? {
        do {
            let decoder = JSONDecoder()
            let stops = try decoder.decode([Stop].self, from: data)
            return stops
        } catch let error {
            print(error)
        }
        
        return nil
    }
    
    var jsonData: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
    
    var jsonString: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension Stop {
    enum CodingKeys: String, CodingKey {
        case stopDirection = "stop_direction"
        case parentStation = "parent_station"
        case locationType = "location_type"
        case code = "stop_code"
        case lat = "stop_lat"
        case lon = "stop_lon"
        case name = "stop_name"
        case ID = "stop_id"
        case wheelchairBoarding = "wheelchair_boarding"
    }
}
