//
//  StopsDataProvider.swift
//  SuperBKK
//
//  Created by Mate Papp on 2017. 10. 16..
//  Copyright © 2017. com.matepapp. All rights reserved.
//

import Foundation

protocol StopsDataProvider: DataProvider {
    func fetchStopsData(completion: ((Result<[Stop]>) -> Void)?)
}
