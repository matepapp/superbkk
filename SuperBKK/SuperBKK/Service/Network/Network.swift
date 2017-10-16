//
//  Network.swift
//  SuperBKK
//
//  Created by Mate Papp on 2017. 10. 16..
//  Copyright © 2017. com.matepapp. All rights reserved.
//

import Foundation
import Alamofire

class Network {
    func request(from urlString: String, method: HTTPMethod, completion: @escaping ((Any?) -> Void)) {
        Alamofire.request(urlString, method: method).response { response in
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            
            if let error = response.error {
                print("Error: \(error)")
                completion(nil)
                return
            }
            
            if let data = response.data, let responseString = String(data: data, encoding: .utf8) {
                completion(responseString)
            } else {
                completion(nil)
            }
        }
    }
}

extension Network: StopsDataProvider {
    func fetchStopsData(completion: ((Result<[Stop]>) -> Void)?) {
        request(from: API.Endpoint.stops, method: .get) { response in
            if let responseString = response as? String {
                if let stops = [Stop].from(json: responseString) {
                    completion?(.success(stops))
                } else {
                    completion?(.failure("Couldn't parse the received data"))
                }
            } else {
                completion?(.failure("Didn't receive the data from the server"))
            }
        }
    }
}

