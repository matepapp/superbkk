//
//  Navigation.swift
//  SuperBKK
//
//  Created by Mate Papp on 2017. 10. 16..
//  Copyright © 2017. com.matepapp. All rights reserved.
//

import UIKit

class Navigation {
    private let navigationController: UINavigationController
    private let application: Application
    
    init(window: UIWindow, navigationController: UINavigationController, application: Application) {
        self.application = application
        self.navigationController = navigationController
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
    }
    
    func start() {
        self.showStopsList()
    }
    
    private func showStopsList() {
        let viewModel = StopsViewModel(dataProvider: application.network)
        
        viewModel.didSelectStop = { [weak self] stop in
            self?.showStop(stop: stop)
        }

        let stopsViewController = StopsViewController(viewModel: viewModel)
        self.navigationController.pushViewController(stopsViewController, animated: true)
    }
    
    private func showStop(stop: Stop) {
//        let viewModel = FriendDetailViewModel(
//            friend: friend,
//            imageCache: self.application.imageCache
//        )
//        let instance = FriendDetailViewController(viewModel: viewModel)
//        self.navigationController.pushViewController(instance, animated: true)
    }
}

