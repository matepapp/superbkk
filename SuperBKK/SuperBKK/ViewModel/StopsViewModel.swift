//
//  StopsViewModell.swift
//  SuperBKK
//
//  Created by Mate Papp on 2017. 10. 16..
//  Copyright © 2017. com.matepapp. All rights reserved.
//

import Foundation
import CoreLocation

class StopsViewModel {
    private var dataProvider: StopsDataProvider
    private var mapManager: MapManager
    var stopsViewModel: [StopViewModel]?
    
    var didError: ((String) -> Void)?
    var didUpdate: ((StopsViewModel) -> Void)?
    var didSelectStop: ((Stop) -> Void)?
    
    var title: String {
        if self.isUpdating {
            return "Loading..."
        } else {
            return "Stops from Deak Ferenc square"
        }
    }
    
    private(set) var isUpdating: Bool = false {
        didSet { self.didUpdate?(self) }
    }
    
    init(dataProvider: StopsDataProvider, mapManager: MapManager) {
        self.dataProvider = dataProvider
        self.mapManager = mapManager
    }
    
    func getStopsData() {
        self.isUpdating = true
        
        dataProvider.fetchStopsData { [weak self] result in
            guard let unwrappedSelf = self else { return }
            switch result {
            case .success(let stops):
                unwrappedSelf.stopsViewModel = []
                
                stops.filter {
                    let coordinate = CLLocation(latitude: $0.lat, longitude: $0.lon)
                    return unwrappedSelf.mapManager.isInZone(zone: 1000.0, from: Coordinates.deak, to: coordinate)
                }.forEach { self?.stopsViewModel?.append(StopViewModel(stop: $0)) }
                
                unwrappedSelf.didUpdate?(unwrappedSelf)
            case .failure(let errorMessage):
                unwrappedSelf.didError?(errorMessage)
            }
            
            self?.isUpdating = false
            
        }
    }
}
