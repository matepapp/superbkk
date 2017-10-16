//
//  StopsViewModell.swift
//  SuperBKK
//
//  Created by Mate Papp on 2017. 10. 16..
//  Copyright © 2017. com.matepapp. All rights reserved.
//

import Foundation

class StopsViewModel {
    private var dataProvider: StopsDataProvider
    var stopsViewModel: [StopViewModel]?
    
    var didError: ((String) -> Void)?
    var didUpdate: ((StopsViewModel) -> Void)?
    var didSelectStop: ((Stop) -> Void)?
    
    var title: String {
        if self.isUpdating {
            return "Loading"
        } else {
            return "Stops from Deak Ferenc"
        }
    }
    
    private(set) var isUpdating: Bool = false {
        didSet { self.didUpdate?(self) }
    }
    
    init(dataProvider: StopsDataProvider) {
        self.dataProvider = dataProvider
    }
    
    func getStopsData() {
        self.isUpdating = true
        
        dataProvider.fetchStopsData { [weak self] result in
            guard let unwrappedSelf = self else { return }
            switch result {
            case .success(let stops):
                unwrappedSelf.stopsViewModel = []
                stops.forEach { self?.stopsViewModel?.append(StopViewModel(stop: $0)) }
                unwrappedSelf.didUpdate?(unwrappedSelf)
            case .failure(let errorMessage):
                unwrappedSelf.didError?(errorMessage)
            }
            
            self?.isUpdating = false
            
        }
    }
}
